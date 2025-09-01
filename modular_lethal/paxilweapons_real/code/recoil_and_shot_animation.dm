/obj/item/gun
	/// If this gun has a gunshot animation, this stores info such as icon, icon_state, pixel_x and pixel_y
	var/list/gunshot_animation_information = null
	/// If this gun has a recoil animation, this stores info such as angle and duration
	var/list/recoil_animation_information = null
	/// If this gun gets larger when suppressed
	var/gets_larger_suppressed = FALSE

/// Summons the firing animation upon the firearm when called
/obj/item/gun/proc/firing_animation(mob/user, burst_fire = FALSE)
	if(gunshot_animation_information)
		INVOKE_ASYNC(src, .proc/gunshot_animation, user, burst_fire)
	if(recoil_animation_information)
		INVOKE_ASYNC(src, .proc/recoil_animation, user, burst_fire)

/// Makes the actual gunshot animation on the weapon
/obj/item/gun/proc/gunshot_animation(mob/user, burst_fire = FALSE)
	if(suppressed && LAZYACCESS(gunshot_animation_information, "inactive_when_silenced"))
		return
	var/shot_icon = gunshot_animation_information["icon"] || 'modular_lethal/paxilweapons_real/icons/gunshot.dmi'
	var/shot_icon_state = gunshot_animation_information["icon_state"] || "gunshot"
	var/shot_duration = gunshot_animation_information["duration"] || 2
	var/shot_pixel_x = gunshot_animation_information["pixel_x"] || 0
	var/shot_pixel_y = gunshot_animation_information["pixel_y"] || 0
	var/image/shots_fired = image(shot_icon, shot_icon_state, src.layer-0.01)
	shots_fired.pixel_x = shot_pixel_x
	shots_fired.pixel_y = shot_pixel_y
	add_overlay(shots_fired)
	sleep(shot_duration)
	cut_overlay(shots_fired)

/// Make the recoil animation on the gun
/obj/item/gun/proc/recoil_animation(mob/user, burst_fire = FALSE)
	if(recoil_animation_information["doing_recoil_burst_animation"])
		return
	if(burst_fire)
		return recoil_animation_burst(user, burst_fire)

	var/recoil_angle_upper = recoil_animation_information["recoil_angle_upper"] || -20
	var/recoil_angle_lower = recoil_animation_information["recoil_angle_lower"] || -40
	var/recoil_speed = recoil_animation_information["recoil_speed"] || 2
	var/return_speed = recoil_animation_information["return_speed"] || 2
	var/recoil_easing = recoil_animation_information["recoil_easing"] || ELASTIC_EASING
	var/return_easing = recoil_animation_information["return_easing"] || ELASTIC_EASING

	var/matrix/return_matrix = matrix(transform)
	var/matrix/recoil_matrix = matrix(transform)
	recoil_matrix = recoil_matrix.Turn(rand(recoil_angle_lower, recoil_angle_upper))

	animate(src, transform = recoil_matrix, time = recoil_speed, easing = recoil_easing)
	sleep(recoil_speed)
	animate(src, transform = return_matrix, time = return_speed, easing = return_easing)

/// Like recoil animations but for burst fire
/obj/item/gun/proc/recoil_animation_burst(mob/user, burst_fire = FALSE)
	var/recoil_burst_angle_upper = recoil_animation_information["recoil_burst_angle_upper"] || -5
	var/recoil_burst_angle_lower = recoil_animation_information["recoil_burst_angle_upper"] || -10
	var/recoil_burst_speed = recoil_animation_information["recoil_burst_speed"] || 0.5
	var/return_burst_speed = recoil_animation_information["return_burst_speed"] || 0.5
	var/recoil_burst_easing = recoil_animation_information["recoil_burst_easing"] || ELASTIC_EASING
	var/return_burst_easing = recoil_animation_information["return_burst_easing"] || ELASTIC_EASING
	var/recoil_burst_pixel_x = recoil_animation_information["recoil_burst_pixel_x"] || -5
	var/recoil_burst_pixel_y = recoil_animation_information["recoil_burst_pixel_y"] || 0

	var/old_pixel_x = pixel_x
	var/new_pixel_x = pixel_x+recoil_burst_pixel_x
	var/old_pixel_y = pixel_y
	var/new_pixel_y = pixel_y+recoil_burst_pixel_y
	var/matrix/return_matrix = matrix(transform)
	var/matrix/recoil_matrix = matrix(transform)
	recoil_matrix = recoil_matrix.Turn(rand(recoil_burst_angle_lower, recoil_burst_angle_upper))

	recoil_animation_information["doing_recoil_burst_animation"] = TRUE
	for(var/i in 1 to burst_size)
		animate(src, transform = recoil_matrix, time = recoil_burst_speed, easing = recoil_burst_easing, flags = ANIMATION_PARALLEL)
		animate(src, pixel_x = new_pixel_x, time = recoil_burst_speed, easing = recoil_burst_easing, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = new_pixel_y, time = recoil_burst_speed, easing = recoil_burst_easing, flags = ANIMATION_PARALLEL)
		sleep(recoil_burst_speed)
		animate(src, transform = return_matrix, pixel_x = old_pixel_x, pixel_y = old_pixel_y, time = return_burst_speed, easing = return_burst_easing, flags = ANIMATION_PARALLEL)
		animate(src, pixel_x = old_pixel_x, time = return_burst_speed, easing = recoil_burst_easing, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = old_pixel_y, time = return_burst_speed, easing = recoil_burst_easing, flags = ANIMATION_PARALLEL)
		sleep(return_burst_speed)
	recoil_animation_information["doing_recoil_burst_animation"] = FALSE

/// All the stuff below this is just for updating important information for recoil stuff

/obj/item/gun/ballistic/install_suppressor(obj/item/suppressor/suppressor_added)
	suppressed = suppressor_added
	if(gets_larger_suppressed)
		update_weight_class(w_class += suppressor_added.w_class)
	for(var/variable in gunshot_animation_information)
		var/associated_value = gunshot_animation_information[variable]
		gunshot_animation_information -= variable
		gunshot_animation_information["old_[variable]"] = associated_value
	update_appearance()

/obj/item/gun/ballistic/clear_suppressor()
	if(!can_unsuppress)
		return
	if(gets_larger_suppressed)
		var/obj/item/suppressor/gun_suppressor = suppressed
		update_weight_class(w_class -= gun_suppressor.w_class)
	for(var/variable in gunshot_animation_information)
		var/associated_value = gunshot_animation_information[variable]
		gunshot_animation_information -= variable
		if(findtext(variable, "old_", 1, 5))
			gunshot_animation_information[copytext(variable, 5)] = associated_value
		else
			gunshot_animation_information[variable] = associated_value
	suppressed = null
	update_appearance()
