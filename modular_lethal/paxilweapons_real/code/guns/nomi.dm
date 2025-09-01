// Drum fed semi-automatic shotgun firing 12ga

/obj/item/gun/ballistic/automatic/nomi_shotgun
	name = "\improper Nomi repeating shotgun"
	desc = "A semi-automatic shotgun that fires 12ga out of a ten shell drum."
	icon = 'modular_lethal/paxilweapons_real/icons/shotgun_48.dmi'
	icon_state = "nomi"
	worn_icon = 'modular_lethal/paxilweapons_real/icons/onmob/guns_worn.dmi'
	worn_icon_state = "nomi"
	lefthand_file = 'modular_lethal/paxilweapons_real/icons/onmob/guns_inhand_left.dmi'
	righthand_file = 'modular_lethal/paxilweapons_real/icons/onmob/guns_inhand_right.dmi'
	inhand_icon_state = "nomi"
	SET_BASE_PIXEL(-8, 0)
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/c12nomi
	load_sound = 'modular_lethal/paxilweapons_real/sound/nomi/nomi_magin.ogg'
	rack_sound = 'modular_lethal/paxilweapons_real/sound/nomi/nomi_rack.wav'
	fire_sound = 'modular_lethal/paxilweapons_real/sound/nomi/nomi.wav'
	pickup_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_mediumgun.wav'
	drop_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_mediumgun.wav'
	can_suppress = FALSE
	burst_size = 2
	fire_delay = 0.5 SECONDS
	projectile_wound_bonus = -20
	projectile_damage_multiplier = 0.75
	recoil = 0.5
	gunshot_animation_information = list(
		"pixel_x" = 34, \
		"pixel_y" = 3, \
		"inactive_wben_suppressed" = TRUE, \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -10, \
		"recoil_angle_lower" = -20, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/nomi_shotgun/add_bayonet_point()
	return

/obj/item/gun/ballistic/automatic/nomi_shotgun/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_XHIHAO)

/obj/item/gun/ballistic/automatic/nomi_shotgun/starts_empty
	spawnwithmagazine = FALSE
