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
	// Any actions associated with being inside the apartment, if relevant.
	var/list/datum/action/actions

/datum/persistent_apartment/New(client/client_of_owner)
	. = ..()
	if (!client_of_owner)
		CRASH("attempted to init a persistent apartment with a null client")

	owner_client = client_of_owner
	owner_ckey = client_of_owner.ckey
	pref_slot = client_of_owner.prefs?.default_slot

	var/apartment_path = "data/player_saves/[owner_ckey[1]]/[owner_ckey]/[pref_slot]/saved_apartment.dmm"
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
	// assuming we succeed with this, we should also clear the map_export_lookup global list 5 seconds or so after the template loading succeeds, since we don't need those pairings anymore.
	// we need to do some funny area application stuff
	for(var/turf/apartment_turf as anything in apartment_turf_reservation.reserved_turfs)
		if (is_safe_turf(apartment_turf)) // this is broken at the moment
			entry_turf = apartment_turf
			break
	loaded = TRUE
	LAZYADDASSOC(GLOB.persistent_apartments, "[owner_ckey]:[pref_slot]", src)
	message_admins("Loaded [owner_ckey]:[pref_slot] persistent apartment, with [GLOB.map_export_storage_loads] storage objects loaded and moving [GLOB.map_export_moves_to_storage] items.")
	GLOB.map_export_storage_loads = 0
	GLOB.map_export_moves_to_storage = 0 // the above may always echo 0 moves because we do moves up to 5s after because of the timer shit

/datum/persistent_apartment/proc/Save()
	// ok this is the meaty shit. we need to set up the export map proc to get only what's in our reservation and then physically save it to disk
	// inside the player saves dir
	if (!owner_ckey || !pref_slot)
		return

	if (!apartment_turf_reservation)
		CRASH("attempted to save a persistent apartment with no turf reservation somehow")

	var/turf/first_corner = apartment_turf_reservation.bottom_left_turfs[1]
	var/turf/second_corner = apartment_turf_reservation.top_right_turfs[1]
	var/map_data = serializeMapAndContents(first_corner, second_corner, apartment_turf_reservation)
	var/file_path = "data/player_saves/[owner_ckey[1]]/[owner_ckey]/[pref_slot]/saved_apartment.dmm"

	rustg_file_write(map_data, file_path)
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
		GLOB.persistent_apartments.Remove(owner_client)
		owner_client = null
	if (apartment_area)
		QDEL_NULL(apartment_area)
	if (actions)
		QDEL_NULL(actions)
	return ..()

// we should serialize the apartment when:
