// Smartgun YEAH SMARTGUN!!

/obj/item/gun/ballistic/automatic/smartgun
	gunshot_animation_information = list(
		"pixel_x" = 19, \
		"pixel_y" = 2, \
		"inactive_wben_suppressed" = TRUE, \
		"icon_state" = "pulseshot" \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -10, \
		"recoil_angle_lower" = -20, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/smartgun/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_CARWO)
