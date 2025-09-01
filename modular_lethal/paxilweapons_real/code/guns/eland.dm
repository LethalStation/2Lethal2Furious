// .35 Sol mini revolver

/obj/item/gun/ballistic/revolver/sol
	name = "\improper Eland Revolver"
	desc = "A small revolver with a comically short barrel and cylinder space for eight .35 Sol Short rounds."
	icon = 'modular_lethal/paxilweapons_real/icons/pistol_32.dmi'
	icon_state = "eland"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/c35sol
	suppressor_x_offset = -1
	w_class = WEIGHT_CLASS_SMALL
	can_suppress = TRUE
	recoil = 0.25
	pickup_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_lightgun.wav'
	drop_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_lightgun.wav'
	gunshot_animation_information = list(
		"pixel_x" = 13, \
		"pixel_y" = 2, \
		"inactive_wben_suppressed" = TRUE, \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -15, \
		"recoil_angle_lower" = -30, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/revolver/sol/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_TRAPPISTE)
