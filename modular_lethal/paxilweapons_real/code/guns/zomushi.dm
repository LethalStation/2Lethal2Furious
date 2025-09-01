// Pistol but its evil and uses miecz magazines

/obj/item/gun/ballistic/automatic/pistol/weevil
	name = "\improper Zomushi pistol"
	desc = "A rare pistol firing the .27-54 cartridge out of standard Miecz magazines."
	icon = 'modular_lethal/paxilweapons_real/icons/pistol_32.dmi'
	icon_state = "zomushi"
	rack_sound = 'modular_lethal/paxilweapons_real/sound/zomushi/zomushi_rack.wav'
	fire_sound = 'modular_lethal/paxilweapons_real/sound/zomushi/zomushi.wav'
	suppressed_sound = 'modular_lethal/paxilweapons_real/sound/zomushi/zomushi_silenced.wav'
	pickup_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_lightgun.wav'
	drop_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_lightgun.wav'
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/miecz
	suppressor_x_offset = 7
	suppressor_y_offset = 0
	fire_delay = 0.25 SECONDS
	recoil = 0.25
	muzzleflash_iconstate = "muzzle_flash_light"
	gunshot_animation_information = list(
		"pixel_x" = 14, \
		"pixel_y" = 3, \
		"inactive_wben_suppressed" = TRUE, \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -15, \
		"recoil_angle_lower" = -30, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/pistol/weevil/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_XHIHAO)

/obj/item/gun/ballistic/automatic/pistol/weevil/starts_empty
	spawnwithmagazine = FALSE
