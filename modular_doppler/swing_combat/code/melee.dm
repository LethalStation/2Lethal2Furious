/obj/item/melee/proc/start_swing_attack(atom/target, mob/attacker)
	var/attack_dir = get_vague_dir(attacker, target)
	run_swing_attack(attack_dir, attacker)

/obj/item/melee/proc/run_swing_attack(direction, mob/attacker)
	var/list/target_turfs = get_turfs_and_adjacent_in_direction(attacker, direction)
	var/turf_index = 1
	var/list/debug_turf_colors = list(
		"#ff0000",
		"#00ff00",
		"#0000ff",
	)
	for(var/turf/target_turf in target_turfs)
		target_turf.add_atom_colour(debug_turf_colors[turf_index], TEMPORARY_COLOUR_PRIORITY)
		turf_index++
		if(target_turf.is_blocked_turf(exclude_mobs = TRUE))
			if(target_turf.density)
				return
			for(var/atom/movable/potentially_blocking_thing as anything in target_turf.contents)
				if(ismob(potentially_blocking_thing))
					continue
				if(!potentially_blocking_thing.density)
					continue
				melee_attack_chain(attacker, potentially_blocking_thing)
				return // If we hit something solid that's not a mob then we stop
		for(var/mob/new_victim in target_turf.contents)
			melee_attack_chain(attacker, new_victim)
			return
	// The animation is only played if we don't hit anything
	animate_attack(attacker, get_step(attacker, direction), ATTACK_ANIMATION_SLASH)

// For testing
/obj/item/melee/tizirian_sword/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	start_swing_attack(interacting_with, user)
	return ITEM_INTERACT_SUCCESS
