/obj/item/melee/proc/start_swing_attack(atom/target, mob/living/attacker, backwards)
	if(!attacker.combat_mode)
		return ITEM_INTERACT_SUCCESS
	if(attacker.next_move > world.time)
		return ITEM_INTERACT_SUCCESS
	var/attack_dir = get_vague_dir(attacker, target)
	run_swing_attack(attack_dir, attacker, backwards)
	attacker.changeNext_move(attack_speed)
	return ITEM_INTERACT_SUCCESS

/obj/item/melee/proc/run_swing_attack(direction, mob/attacker, backwards, multihit)
	var/list/target_turfs = get_turfs_and_adjacent_in_direction(attacker, direction, backwards)
	var/turf_index = 1
	for(var/turf/target_turf in target_turfs)
		// The animation is only played if we don't hit anything by turf two
		if(turf_index == 2)
			animate_attack_swing_combat(attacker, get_step(attacker, direction), ATTACK_ANIMATION_SLASH, backwards)
			attacker.do_attack_animation(target_turf, no_effect = TRUE)
			playsound(attacker, 'sound/items/weapons/fwoosh.ogg', 50, TRUE)
		turf_index++
		if(target_turf.is_blocked_turf(exclude_mobs = TRUE))
			if(target_turf.density)
				animate_attack_swing_combat(attacker, target_turf, ATTACK_ANIMATION_PIERCE)
				attacker.Shake(1, 1, 0.5 SECONDS)
				do_sparks(2, FALSE, target_turf)
				playsound(attacker, 'sound/items/weapons/parry.ogg', 50, TRUE)
				return
			// This part stops grilles getting hit under windows and stuff
			var/list/real_order_turf_contents = reverse_range(target_turf.contents)
			for(var/atom/movable/potentially_blocking_thing as anything in real_order_turf_contents)
				if(ismob(potentially_blocking_thing))
					continue
				if(!potentially_blocking_thing.density)
					continue
				melee_attack_chain(attacker, potentially_blocking_thing)
				return // If we hit something solid that's not a mob then we stop
		for(var/mob/living/new_victim in target_turf.contents)
			if((new_victim.body_position == LYING_DOWN) && (HAS_TRAIT(new_victim, TRAIT_INCAPACITATED)))
				continue // Swings miss you if you're incapacitated and floored
			melee_attack_chain(attacker, new_victim)
			if(!multihit)
				return

// For testing
/obj/item/melee/tizirian_sword/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user)

/obj/item/melee/tizirian_sword/ranged_interact_with_atom_secondary(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user, TRUE)
