/obj/machinery/light
	/// Does the light get shifted when facing northward
	var/wall_mounted_northward = TRUE

/obj/machinery/light/floor
	wall_mounted_northward = FALSE

/obj/machinery/light/update_overlays()
	. = ..()
	if(wall_mounted_northward && (dir == NORTH))
		pixel_y = 16
	else
		pixel_y = 0
