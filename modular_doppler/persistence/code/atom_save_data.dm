GLOBAL_LIST_EMPTY(map_export_lookup) // used to link atom_storage hashes and other things temporarily, assoc list (hash -> direct (newly made from import) object ref)
GLOBAL_VAR_INIT(map_export_storage_loads, 0)
GLOBAL_VAR_INIT(map_export_moves_to_storage, 0)

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

	//FUN EXTRA SHIT!!!
	// - FIND EVERY ATOM STORAGE WITH STUFF IN THEM IN THESE BOUNDS.
	// - ASSIGN EVERY ATOM THAT HAS STUFF IN IT A UNIQUE HASH.
	// - POP OPEN EVERY ATOM STORAGE AND SPILL ITS CONTENTS ONTO ITS BASE LOC (TURF).
	// - TAG EVERY ITEM WE SPILL OUT WITH THE SOURCE ATOM'S HASH THAT WE ASSIGNED EARLIER.
	// - during initialize we will check to see if there's a matching lookup hash. if there is, we will force move everything into the first object we find that matches our lookup hash's storage

	//you know technically we can just iterate through the reservation's turfs...
	for(var/turf/the_turf in reserve.reserved_turfs)
		if (the_turf)
			for (var/atom/thing as anything in the_turf.contents)
				if (thing.atom_storage)
					cascade_storage_lookup(thing, the_turf)
				if (istype(thing, /obj/structure/closet)) // dump out our contents
					var/obj/structure/closet/our_locker = thing
					our_locker.export_master = generate_hash()
					our_locker.export_dump_contents(the_turf)


	var/dat = write_map(minx, miny, minz, maxx, maxy, maxz, save_flag, shuttle_flag)
	GLOB.map_writing_running = FALSE

	return dat

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

//the map exporter calls get_save_vars() on anything it tries to save, and will attempt to export those fields into the map save
// theoretically this means we can add overloaded fields/variables on objects, making unique use of the /datum/serialize_list and other procs to save any special contents to said field, then overload an init to deserialize their special datum contents from said field and reload the object as it was when we saved it
// this is most applicable for things with odd vars like written documents and photos and reagent containers. possibly mechs? modsuits? i dunno, it depends how far down we wanna go with this
// this will be big and clunky and is really not efficient compared to doing manual db read/writes for stuff but it's also likely the quickest way to get this shit rolling

// PHOTOS & PICTURES:
// for /datum/picture you can likely just call log_to_file then ensure logpath is kept in the atom. at least for loose photos and pinned ones
// idk what we do for ones attached to documents. this shit gonna get pretty crazy pretty quick

// TODO: make sure when executing relocation via map_export_lookup hashes that you only do so after a timer so we can be sure the thing is still in the world

// TODO: we can probably do some RATCHET ASS SHIT where we check for atoms or objects with atom_storage objects, then make them eject their contents onto their tile
// but with a lookup var assigned to them that infers their parent. if they're on the base turf, we can check after they've all initialized after 5 seconds or so,
// find their newly spawned object in the map_export_lookup table then move anything that was inside it back where it's supposed to be
// as long as we go as deep as we possibly can (up to 2 bags deep should catch 99% of everything then) we should be gucchi


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

// DOCUMENTS & PAPER
/obj/item/paper
	/// USED EXCLUSIVELY FOR RECONSTRUCTING DOCUMENTS AFTER MAP EXPORT
	var/saved_paperdata // Do we have saved paper data to export?

/obj/item/paper/get_save_vars()
	. = ..()
	if (LAZYLEN(raw_text_inputs) || LAZYLEN(raw_stamp_data) || LAZYLEN(raw_field_input_data))
		saved_paperdata = json_encode(convert_to_data())
		. += NAMEOF(src, saved_paperdata)
	return .

/obj/item/paper/Initialize(mapload)
	. = ..()
	if (saved_paperdata)
		var/list/our_data = json_decode(saved_paperdata) // okay well this doesn't seem to work
		// we're probably gonna need to try adding proper serialize_list stuff for all the paper datums
		// set the whole thing up so we can serialize it to a blob, save the blob, then load the blob
		if (our_data)
			write_from_data(our_data)
			saved_paperdata = null
		else
			message_admins("MAP IMPORT: Failed to load paper data from disk. Bummer. (decode)")

// TODO:
// consider how bags are gonna work
// do obj/machinery need special considerations?


// weird types to serialize:
// documents contain text input datums that need to have serialize_list set - NOPE NEVERMIND
// pictures already serialize_list properly but do they actually save photos to disk? - THEY DO AND WE SHOULD HAVE AN EZ WAY TO DO THIS
// reagent containers need to serialize their reagents value - WRITE A THING TO JSON_ENCODE THE REAGENTS_LIST THEN LOAD IT
