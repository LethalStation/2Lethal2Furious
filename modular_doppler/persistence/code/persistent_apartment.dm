/datum/persistent_apartment
	// Which client this apartment belong to?
	var/client/owner_client
	// The turf reservation for the spawned template
	var/datum/turf_reservation/apartment_turf_reservation
	// The map template we made using either the base apartment template (for new apartments) or the one we loaded from their prefs
	var/datum/map_template/apartment_template
	// The area for their spawned template
	var/area/apartment_area
	// Is the persistent apartment ready for use?
	var/loaded = FALSE
	// The main entry turf for entering the space.
	var/turf/entry_turf
	// The ckey of the person this apartment belongs to.
	var/owner_ckey
	// The pref slot of the character this apartment belongs to.
	var/pref_slot

/datum/persistent_apartment/New(client/client_of_owner)
	. = ..()
	if (!client_of_owner)
		CRASH("attempted to init a persistent apartment with a null client")

	owner_client = client_of_owner
	owner_ckey = client_of_owner.ckey
	pref_slot = client_of_owner.prefs?.default_slot
	// from here, we do the magic:
	// 1. read their prefs and determine if we need to make a new apartment for them or load their old one
	// 2. load either the base map template for new apartments or make a new map template at runtime for their player_saves apartment_dmm
	// 3. reserve a turf for said base map template and assign it to this
	// 4. load in the map template to this reservation
	// 5. set loaded to true and... that should be it
	var/apartment_path = owner_client.prefs?.read_preference(/datum/preference/persistent/apartment_dmm)
	if (!apartment_path)
		//no existing one, so spawn them the base one
		apartment_template = new /datum/map_template/base_gakster_apartment
		message_admins("No existing template found, creating a new one.")
	else
		// check to see if the file exists first, otherwise fallback and spawn a default one
		if (rustg_file_exists(apartment_path))
			apartment_template = new /datum/map_template(apartment_path, "Pentola Apartment")
			message_admins("Attempting to load [owner_ckey]:[pref_slot] persistent apartment from [apartment_path]...")
		else
			apartment_template = new /datum/map_template/base_gakster_apartment
			message_admins("Failed to load [owner_ckey]:[pref_slot] apartment template from file, falling back to base.")

	// got the template hopefully, so now load it in
	apartment_turf_reservation = SSmapping.request_turf_block_reservation(
		apartment_template.width,
		apartment_template.height,
		1,
	)
	if (!apartment_turf_reservation)
		CRASH("failed to reserve area for apartment loading")
	var/turf/bottom_left = apartment_turf_reservation.bottom_left_turfs[1]
	apartment_template.load(bottom_left, centered = FALSE)
	for(var/turf/apartment_turf in apartment_turf_reservation.reserved_turfs)
		if (is_safe_turf(apartment_turf))
			entry_turf = apartment_turf
			break
	loaded = TRUE
	LAZYADDASSOC(GLOB.persistent_apartments, owner_client, src)

/datum/persistent_apartment/proc/Save()
	// ok this is the meaty shit. we need to set up the export map proc to get only what's in our reservation and then physically save it to disk
	// inside the player saves dir
	if (!owner_ckey || !pref_slot)
		return

	if (!apartment_turf_reservation)
		CRASH("attempted to save a persistent apartment with no turf reservation somehow")

	//INITIAL CONSIDERATIONS:
	// need to iterate through all storage items and open them so they save their contents inside the actual apartment, should be simple
	// anything with attachments/gears needs to also undergo a similar process
	// written texts also need to have their raw_input_texts converted into a csv then reassembled
	// check to see how chemistry contents fare?
	// machinery objects will probably be interesting

	var/turf/first_corner = apartment_turf_reservation.bottom_left_turfs[2] // we may need to adjust these to 2 instead of 1 to not save the ring border turf reserve makes
	var/turf/second_corner = apartment_turf_reservation.top_right_turfs[2]
	var/map_data = serializeMapAndContents(first_corner, second_corner)
	// data/player_saves/[ckey[1]]/[ckey]/[filename]"
	// default_slot in client.prefs? carries the slot number of the current save
	var/file_path = "data/player_saves/[owner_ckey[1]]/[owner_ckey]/[pref_slot]/saved_apartment.dmm"
	rustg_file_write(map_data, file_path)
	owner_client.prefs?.write_preference(/datum/preference/persistent/apartment_dmm, file_path)
	message_admins("Persistent apartment ([owner_ckey]:[pref_slot]) successfully saved.")

/datum/persistent_apartment/Del()
	// attempt to save this to disk before we delete it just to make sure we don't lose data
	if (loaded)
		Save()
	// clean up everything so we don't hard delete
	if (apartment_template)
		QDEL_NULL(apartment_template)
	if (apartment_turf_reservation)
		apartment_turf_reservation.Release()
		QDEL_NULL(apartment_turf_reservation)
	if (owner_client)
		owner_client = null
	if (apartment_area)
		QDEL_NULL(apartment_area)

	return ..()

// we should serialize the apartment when:

/proc/serializeMapAndContents(turf/cornerA, turf/cornerB, save_flag = ALL, shuttle_flag = SAVE_SHUTTLEAREA_DONTCARE)
	// cut down version of _save_map without the constraints
	GLOB.map_writing_running = TRUE

	var/minx = min(cornerA.x, cornerB.x)
	var/miny = min(cornerA.y, cornerB.y)
	var/minz = min(cornerA.z, cornerB.z)

	var/maxx = max(cornerA.x, cornerB.x)
	var/maxy = max(cornerA.y, cornerB.y)
	var/maxz = max(cornerA.z, cornerB.z)

	var/dat = write_map(minx, miny, minz, maxx, maxy, maxz, save_flag, shuttle_flag)
	GLOB.map_writing_running = FALSE

	return dat

