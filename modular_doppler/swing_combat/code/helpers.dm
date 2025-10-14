/**
 * Returns a list of turfs, from left to right (by default), that are in the direction from the base atom
 *
 * For example, a the dir of north would give you the tile to the top left, top, and top right from the base
 * And a dir of northwest would give you the tile directly left, top left, and directly top
 *
 * * base - The atom to get the turfs from
 * * general_dir - The direction to get the turfs in
 * * reversed - Whether or not to reverse the order of the turfs, from left to right to right to left instead
 */
/proc/get_turfs_and_adjacent_in_direction(atom/base, general_dir, reversed = FALSE)
	var/list/result_list = list()
	var/turf/left_turf = get_step(base, turn(general_dir, -45))
	var/turf/middle_turf = get_step(base, general_dir)
	var/turf/right_turf = get_step(base, turn(general_dir, 45))

	if(istype(left_turf))
		result_list += left_turf
	if(istype(middle_turf))
		result_list += middle_turf
	if(istype(right_turf))
		result_list += right_turf

	if(reversed)
		reverse_range(result_list)

	return result_list

/// Gets a dir towards a target, so that 90% of attacks aren't diagonal
/proc/get_vague_dir(atom/source, atom/target)
	return angle2dir(get_angle(source, target))

/// USE /obj/item/proc/animate_attack(atom/movable/attacker, atom/attacked_atom, animation_type) TO ANIMATE
