/obj/structure/rimworld_door
	name = "debug door"
	desc = "A door from god."
	icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/building_structures/icons/doors.dmi'
	icon_state = "debug"
	base_icon_state = "debug"
	density = TRUE
	opacity = TRUE
	anchored = TRUE
	max_integrity = 200
	can_atmos_pass = ATMOS_PASS_DENSITY
	smoothing_groups = SMOOTH_GROUP_LETHAL_DOORS
	/// Is this door currently opened
	var/door_open = FALSE
	/// The sound it makes when opening
	var/opening_sound = null
	/// The sound it makes when closing
	var/closing_sound = null
	/// How long it takes to open this door
	var/opening_time = 1 SECONDS

/obj/structure/rimworld_door/Initialize(mapload)
	. = ..()
	QUEUE_SMOOTH_NEIGHBORS(src)
	air_update_turf(TRUE)

/obj/structure/rimworld_door/Bumped(mob/bumper)
	..()
	if(!door_open && istype(bumper))
		return try_to_change_me_girl(bumper)

/obj/structure/rimworld_door/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)

/obj/structure/rimworld_door/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	return try_to_change_me_girl(user)

/obj/structure/rimworld_door/proc/try_to_change_me_girl(mob/user)
	if(door_open)
		if(!do_after(user, opening_time / 2, src)) // Closing is faster because it's not automatic
			return
		icon_state = base_icon_state
		door_open = FALSE
		if(closing_sound)
			playsound(src, closing_sound, 50, TRUE)
	else
		if(!do_after(user, opening_time, src))
			return
		icon_state = "[base_icon_state]-open"
		door_open = TRUE
		if(opening_sound)
			playsound(src, opening_sound, 50, TRUE)
	set_density(!door_open)
	set_opacity(!door_open)
	air_update_turf(TRUE)
	update_appearance()

// The doors for real

/obj/structure/rimworld_door/wood
	name = "wooden door"
	desc = "A simple door made of wood."
	icon_state = "wood"
	base_icon_state = "wood"
	max_integrity = 200
	opening_sound = 'sound/machines/closet/wooden_closet_open.ogg'
	closing_sound = 'sound/machines/closet/wooden_closet_close.ogg'
	opening_time = 1 SECONDS

/obj/structure/rimworld_door/stone
	name = "stone door"
	desc = "A heavy door made from solid stone."
	icon_state = "stone"
	base_icon_state = "stone"
	max_integrity = 400
	opening_sound = 'sound/effects/stonedoor_openclose.ogg'
	closing_sound = 'sound/effects/stonedoor_openclose.ogg'
	opening_time = 3 SECONDS
