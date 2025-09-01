// Base Sol SMG

/obj/item/gun/ballistic/automatic/sol_smg
	name = "\improper Sindano Submachine Gun"
	desc = "A small submachine gun firing .35 Sol. Commonly seen in the hands of PMCs \
		and other unsavory types. Accepts any standard Sol pistol magazine."
	icon = 'modular_lethal/paxilweapons_real/icons/smg_32.dmi'
	icon_state = "sindano"
	lefthand_file = 'modular_lethal/paxilweapons_real/icons/onmob/guns_inhand_left.dmi'
	righthand_file = 'modular_lethal/paxilweapons_real/icons/onmob/guns_inhand_right.dmi'
	inhand_icon_state = "sindano"
	worn_icon = 'modular_lethal/paxilweapons_real/icons/onmob/guns_worn.dmi'
	worn_icon_state = "sindano"
	special_mags = TRUE
	bolt_type = BOLT_TYPE_OPEN
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	accepted_magazine_type = /obj/item/ammo_box/magazine/c35sol_pistol
	spawn_magazine_type = /obj/item/ammo_box/magazine/c35sol_pistol/stendo
	fire_sound = 'modular_lethal/paxilweapons_real/sound/sindano/smg_light.ogg'
	can_suppress = TRUE
	suppressor_x_offset = 7
	burst_size = 3
	fire_delay = 0.2 SECONDS
	spread = 7.5
	recoil = 0.25
	pickup_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_mediumgun.wav'
	drop_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_mediumgun.wav'
	gunshot_animation_information = list(
		"pixel_x" = 17, \
		"pixel_y" = 0, \
		"inactive_wben_suppressed" = TRUE, \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -10, \
		"recoil_angle_lower" = -20, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/sol_smg/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_CARWO)

/obj/item/gun/ballistic/automatic/sol_smg/no_mag
	spawnwithmagazine = FALSE
