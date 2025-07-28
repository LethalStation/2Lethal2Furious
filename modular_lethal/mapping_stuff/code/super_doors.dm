/// Contains manually opened doors that can be kicked open as well for a fun time
/obj/structure/mineral_door/lethal
	icon = 'modular_lethal/mapping_stuff/icons/mineral_doors.dmi'
	icon_state = "standard"
	layer = ABOVE_WINDOW_LAYER + 0.01
	close_delay = 30 SECONDS
	openSound = 'modular_lethal/mapping_stuff/sounds/door_open.ogg'
	closeSound = 'modular_lethal/mapping_stuff/sounds/door_close.ogg'
	smoothing_groups = SMOOTH_GROUP_LETHAL_DOORS
	/// Sound we make when someone kicks the door but fucks up
	var/kick_fail_sound = 'modular_lethal/mapping_stuff/sounds/door_kick_fail.ogg'
	/// Sound we make when someone kicks the door and gets it right
	var/kick_success_sound = 'modular_lethal/mapping_stuff/sounds/door_kick_w.ogg'
	/// What chance do you have to kick this door open every attempt?
	var/door_kick_chance = 60
	/// Overlay we display when a door is being kicked in
	var/mutable_appearance/telegraph_overlay

/obj/structure/mineral_door/lethal/Initialize(mapload)
	. = ..()
	telegraph_overlay = mutable_appearance('icons/mob/telegraphing/telegraph_holographic.dmi', "target_box")

/obj/structure/mineral_door/lethal/Destroy()
	telegraph_overlay = null
	return ..()

/obj/structure/mineral_door/lethal/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>Right-Click</b> to kick the door open, which is typically quicker than opening it like normal.")

/obj/structure/mineral_door/lethal/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(door_opened)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	var/turf/telegraph_turf = telegraph_kick(user)
	if(!do_after(user, 0.5 SECONDS, src))
		stop_telegraph(telegraph_turf)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	if(!prob(door_kick_chance))
		playsound(src, kick_fail_sound, 100, TRUE, 3)
		Shake(1, 1, 1 SECONDS)
		stop_telegraph(telegraph_turf)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	else
		Open(TRUE)
		chief_kickabitch_from_the_casino(user, telegraph_turf)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/mineral_door/lethal/CanPass(atom/movable/mover, border_dir)
	. = ..()
	if(isliving(mover) && mover.throwing)
		INVOKE_ASYNC(src, PROC_REF(crash_addiction), mover)
		return TRUE
	return .

/// Crashes the door open if someone gets thrown into it
/obj/structure/mineral_door/lethal/proc/crash_addiction(mob/living/crashed_mob)
	if(!door_opened)
		crashed_mob.Knockdown(3 SECONDS)
		Open(TRUE)

/// Warns people on the other side of a door that it's about to be kicked open (and dangerous)
/obj/structure/mineral_door/lethal/proc/telegraph_kick(mob/user)
	var/turf/turf_to_telegraph = get_step(src, get_dir(user, src))
	if(!turf_to_telegraph)
		message_admins("[src] tried to telegraph a door kick but had no target turf, this is wrong.")
		return
	turf_to_telegraph.add_overlay(telegraph_overlay)
	return turf_to_telegraph

/// Finds everyone in the telegraph turf and throws them across the room
/obj/structure/mineral_door/lethal/proc/chief_kickabitch_from_the_casino(mob/user, turf/telegraph_turf)
	var/turf/throwtarget = get_edge_target_turf(src, get_dir(src, telegraph_turf))
	for(var/atom/movable/kicked_thing as anything in telegraph_turf.contents)
		if(isturf(kicked_thing))
			continue
		if(kicked_thing.anchored)
			continue
		if(isliving(kicked_thing))
			var/mob/living/kicked_mob = kicked_thing
			kicked_mob.Knockdown(3 SECONDS)
			to_chat(kicked_mob, span_userdanger("[src] slams into you, throwing you back!"))
		kicked_thing.safe_throw_at(
			target = throwtarget,
			range = 3,
			speed = 2,
			thrower = user,
			force = MOVE_FORCE_STRONG,
		)
	stop_telegraph(telegraph_turf)

/// Removes a telegraph overlay if there is one from the given turf, if there is one
/obj/structure/mineral_door/lethal/proc/stop_telegraph(turf/telegraph_turf)
	if(!telegraph_turf)
		return
	telegraph_turf.cut_overlay(telegraph_overlay)

/obj/structure/mineral_door/lethal/TryToSwitchState(atom/user)
	if(isliving(user))
		if(!can_interact(user))
			return
		if(!do_after(user, 1.5 SECONDS, src))
			return
		SwitchState()
	else if(ismecha(user))
		SwitchState()

/obj/structure/mineral_door/lethal/Open(kicked)
	if(!kicked)
		playsound(src, openSound, 50, TRUE)
	else
		Shake(1, 1, 1 SECONDS)
		playsound(src, kick_success_sound, 100, TRUE, 3)
	set_opacity(FALSE)
	set_density(FALSE)
	door_opened = TRUE
	layer = OPEN_DOOR_LAYER
	air_update_turf(TRUE, FALSE)
	update_appearance()
	if(close_delay != -1)
		addtimer(CALLBACK(src, PROC_REF(Close)), close_delay)

/obj/structure/mineral_door/lethal/Close()
	if(!door_opened)
		return
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		return
	playsound(src, closeSound, 50, TRUE)
	set_density(TRUE)
	set_opacity(TRUE)
	door_opened = FALSE
	layer = initial(layer)
	air_update_turf(TRUE, TRUE)
	update_appearance()

/obj/structure/mineral_door/lethal/standard
	name = "door"
	desc = "A door standard to many places like this. Simple metal sheeting with extra bump plates along the bottom to protect from your boots."
	icon_state = "standard"

/obj/structure/mineral_door/lethal/industrial
	name = "industrial door"
	desc = "A heavy metal plate door with visible rivets for high-test areas."
	icon_state = "industrial"
	door_kick_chance = 30

/obj/structure/mineral_door/lethal/office
	name = "office door"
	desc = "A simple door clad in polymer sheeting, with metal bump plates along the bottom to protect from your boots."
	icon_state = "office"
	door_kick_chance = 70
