GLOBAL_LIST_EMPTY(map_export_lookup) // used to link atom_storage hashes and other things temporarily, assoc list (hash -> direct (newly made from import) object ref)
GLOBAL_VAR_INIT(map_export_storage_loads, 0)
GLOBAL_VAR_INIT(map_export_moves_to_storage, 0)
GLOBAL_LIST_EMPTY(map_export_document_blob) // contains paper/written document data prepared during the export process, saved to a file, resets on each use
GLOBAL_LIST_EMPTY(map_export_reagents_blob) // contains blobs of serialized /datum/reagents linked to export_master keys as an assoc list
/atom/
	var/export_lookup // MAP EXPORT ONLY: are we linked to an object that should be in the map_export lookup table?
	var/export_master // MAP EXPORT ONLY: we had stuff in our atom_storage, and this value is now a hash on GLOB.map_export_lookup that other free items use to figure out that they need to go into us.

/atom/get_save_vars()
	. = ..()
	. += NAMEOF(src, export_lookup)
	. += NAMEOF(src, export_master)
	return .

/atom/Initialize(mapload, ...)
	. = ..()
	if (export_master)
		// we might also be a parent, in which case, we need to register ourselves with the export glob
		LAZYADDASSOC(GLOB.map_export_lookup, export_master, src)
		GLOB.map_export_storage_loads += 1
		// we may also have reagents, so we need to check the global reagents export blob to see if we're in there
		// if we are, reconstruct our .reagents stuff based on on what we have in the blob
		if (GLOB.map_export_reagents_blob[export_master])
			var/datum/reagents/import_reagents = new
			if (!import_reagents.deserialize_list(GLOB.map_export_reagents_blob[export_master]))
				message_admins("MAP IMPORT: failed to deserialize reagents blob for [src] ([export_master])")
			else
				reagents = import_reagents
	if (export_lookup)
		// we expect to be shunted inside a new object created with an export_master key, so we assign our special element (which waits for us and does the moving)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(export_move_atom_to_master), src), 5 SECONDS) // we should probably replace this with a signal or something man

/proc/export_move_atom_to_master(atom/movable/thing)
	if (thing.export_lookup)
		var/atom/where_we_should_be = GLOB.map_export_lookup[thing.export_lookup]
		if (where_we_should_be)
			thing.forceMove(where_we_should_be)
			GLOB.map_export_moves_to_storage += 1
			thing.export_lookup = null
		else
			// ok so this is basically an error that happens exclusively when saves *don't* happen. it shouldn't happen any other time
			message_admins("MAP IMPORT: Tried to move into storage via lookup but couldn't find a master...")

/proc/cascade_storage_lookup(atom/container, turf/target_turf)
	// Dumps storage into a source turf and assigns appropriate map export vars recursively
	if(!container.atom_storage)
		return
	if(!container.export_master)
		container.export_master = generate_hash()
	for(var/atom/movable/item in container)
		CHECK_TICK
		item.export_lookup = container.export_master
		item.forceMove(target_turf)
		if(item.atom_storage)
			cascade_storage_lookup(item, target_turf)

/proc/generate_hash(length = 8)
	var/random_input = "[rand(1, 999999)][world.time][rand(1, 999999)]"
	var/full_hash = md5(random_input)
	return copytext(full_hash, 1, length + 1)

/proc/serializeMapAndContents(turf/cornerA, turf/cornerB, datum/turf_reservation/reserve, save_flag = ALL, shuttle_flag = SAVE_SHUTTLEAREA_DONTCARE)
	GLOB.map_writing_running = TRUE

	var/minx = min(cornerA.x, cornerB.x)
	var/miny = min(cornerA.y, cornerB.y)
	var/minz = min(cornerA.z, cornerB.z)

	var/maxx = max(cornerA.x, cornerB.x)
	var/maxy = max(cornerA.y, cornerB.y)
	var/maxz = max(cornerA.z, cornerB.z)

	// we now meander through all of our reservation's turfs, eject any objects in non-turf locs onto their host turf
	// and then mark them for loading & readding later
	for(var/turf/the_turf in reserve.reserved_turfs)
		if (the_turf)
			for (var/atom/thing as anything in the_turf.contents)
				if (thing.atom_storage)
					cascade_storage_lookup(thing, the_turf)
				if (istype(thing, /obj/structure/closet)) // dump out our contents
					var/obj/structure/closet/our_locker = thing
					our_locker.export_master = generate_hash()
					our_locker.export_dump_contents(the_turf)

	// export the map
	var/dat = write_map(minx, miny, minz, maxx, maxy, maxz, save_flag, shuttle_flag)
	GLOB.map_writing_running = FALSE

	return dat

// if we're an exported object, we don't want to populate with what we should have on mapload - what we've got saved/linked to us is enough.
/obj/item/storage/PopulateContents()
	if (export_master) // we have already been earmarked for shit so don't spawn in whatever our crap's supposed to be
		return

	return ..()

/obj/structure/closet/PopulateContents()
	if (export_master)
		return

	return ..()

/obj/structure/closet/proc/export_dump_contents(turf/place_turf)
	if (!place_turf || !export_master)
		return
	// ensure we're closed too for map export shenanigans
	opened = FALSE
	update_appearance()
	for(var/atom/movable/AM in src)
		CHECK_TICK
		AM.forceMove(place_turf)
		AM.export_lookup = export_master
		if (AM.atom_storage)
			cascade_storage_lookup(AM, place_turf)

// Contains a bunch of additional overloads to enhance the map import/export experience.

// TODO: make sure when executing relocation via map_export_lookup hashes that you only do so after a timer so we can be sure the thing is still in the world

// FOOD ITEMS: save number of bites taken out of it & its way towards decomposition. we may also need to save the existing reagents depending how much i give a shit

/obj/item/food
	var/saved_bites // MAP EXPORT ONLY: how many bites have we taken out of this thing?
	var/saved_decomposition // MAP EXPORT ONLY: have we started decomposing?

/obj/item/food/get_save_vars()
	. = ..()
	var/datum/component/edible/can_eat = src.GetComponent(/datum/component/edible)
	if (can_eat)
		saved_bites = can_eat.bitecount
	var/datum/component/decomposition/can_rot = src.GetComponent(/datum/component/decomposition)
	if (can_rot)
		saved_decomposition = can_rot.get_time()
	. += NAMEOF(src, saved_bites)
	. += NAMEOF(src, saved_decomposition)
	return .

/obj/item/food/Initialize(mapload)
	. = ..()
	if (saved_bites)
		var/datum/component/edible/can_eat = src.GetComponent(/datum/component/edible)
		can_eat.bitecount = saved_bites
		saved_bites = null
	if (saved_decomposition)
		var/datum/component/decomposition/can_rot = src.GetComponent(/datum/component/decomposition)
		can_rot.original_time = saved_decomposition
		saved_decomposition = null

/obj/item/photo
	/// USED EXCLUSIVELY FOR RECONSTRUCTING PHOTOS AFTER MAP EXPORT
	var/saved_picture_id // Our saved picture ID

/obj/item/photo/Initialize(mapload, datum/picture/P, datum_name, datum_desc)
	. = ..()
	if (!isnull(saved_picture_id))
		var/datum/picture/loaded_picture = load_picture_from_disk(saved_picture_id)
		if (loaded_picture)
			picture = loaded_picture
		else
			message_admins("MAP IMPORT: Failed to load saved photo from disk. Bummer. (decode)")

/obj/item/photo/get_save_vars()
	. = ..()
	// called from export: save our picture datum to disk if it isn't already
	. += NAMEOF(src, scribble)
	if (!isnull(picture) && isnull(saved_picture_id))
		picture.log_to_file()
		if (picture.logpath)
			saved_picture_id = picture.id
	. += NAMEOF(src, saved_picture_id)
	return .

// DOCUMENTS & PAPER - CURRENTLY SORT OF WORKS
/obj/item/paper
	/// USED EXCLUSIVELY FOR RECONSTRUCTING DOCUMENTS AFTER MAP EXPORT
	var/export_loadblob // If this is set to anything, we will attempt to load in our data contents from a JSON blob made during the export process.

/obj/item/paper/get_save_vars()
	. = ..()

	if (LAZYLEN(raw_text_inputs) || LAZYLEN(raw_stamp_data) || LAZYLEN(raw_field_input_data))
		// assign ourselves an export hash and then add our data to the list
		export_loadblob = generate_hash()
		LAZYADDASSOCLIST(GLOB.map_export_document_blob, export_loadblob, convert_to_data())

	. += NAMEOF(src, export_loadblob)
	return .

/obj/item/paper/Initialize(mapload)
	. = ..()
	if (export_loadblob && GLOB.map_export_document_blob[export_loadblob])
		// we have an export hash and data in the imported document blob, so reconstitute this object with that data
		write_from_data(GLOB.map_export_document_blob[export_loadblob][1]) // its that shrimple
		update_icon_state()
		update_appearance()

// REAGENTS (chemicals and shit)
// little more complicated: need to implement serialize_list/deserialize_list for things we want to save
// then export serialize_list content associated with an export_master hash
// then if our atom has any reagents we care about, we need to export it to a global reagents blob (complete with export_master hash)
// on atom initialize, check if our export_master value is in the global reagents blob, and if it is, repopulate it

/datum/reagents/serialize_list(list/options, list/semvers)
	. = ..()
	// may as well do this in assoc list form i guess?
	.["reagent_list"] = list()
	// per reagent in the list, save only the shit we care about - we'll reassemble during deserialize_list
	for(var/datum/reagent/reagent as anything in reagent_list)
		.["reagent_list"][reagent.type] = list()
		.["reagent_list"][reagent.type]["volume"] = reagent.volume
		.["reagent_list"][reagent.type]["ph"] = reagent.ph
		.["reagent_list"][reagent.type]["purity"] = reagent.purity
		.["reagent_list"][reagent.type]["color"] = reagent.color

	.["chem_temp"] = chem_temp
	.["ph"] = ph
	.["flags"] = flags
	.["total_volume"] = total_volume
	.["maximum_volume"] = maximum_volume

	SET_SERIALIZATION_SEMVER(semvers, "1.0.0")
	return .

/datum/reagents/deserialize_list(list/input, list/options)
	. = ..()

	if (!.)
		return .

	if (!input["reagent_list"])
		return FALSE

	for(var/reagent_type as anything in input["reagent_list"])
		var/rpath = text2path(reagent_type)
		var/datum/reagent/new_reagent = new rpath
		if (new_reagent)
			new_reagent.volume = input["reagent_list"][reagent_type]["volume"]
			new_reagent.ph = input["reagent_list"][reagent_type]["ph"]
			new_reagent.purity = input["reagent_list"][reagent_type]["purity"]
			new_reagent.color = input["reagent_list"][reagent_type]["color"]
			reagent_list += new_reagent

	chem_temp = input["chem_temp"]
	ph = input["ph"]
	flags = input["flags"]
	total_volume = input["total_volume"]
	maximum_volume = input["maximum_volume"]

	update_total()
	return TRUE

/atom/get_save_vars()
	. = ..()
	if (reagents && LAZYLEN(reagents.reagent_list))
		// we have some reagent content to add to the principle blob
		if (!export_master)
			export_master = generate_hash()
		LAZYADDASSOCLIST(GLOB.map_export_reagents_blob, export_master, reagents.serialize_list(semvers = list()))

// TODO:
// do obj/machinery need special considerations?
// upgraded parts for obj/structures?
// reagents (should be able to use the loadblob premise a la paper just with add_reagent reconstruction for no_react)
// above will also need PopulateContents overriding

//pretzel wants:
// pizza boxes
// safes
// make sure money also works
