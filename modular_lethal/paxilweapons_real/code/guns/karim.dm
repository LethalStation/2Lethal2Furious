// Karim Electrics pulse rifle, YIPPIE ALIENS YIPPIE!!

/obj/item/gun/ballistic/automatic/karim
	name = "\improper Karim Pulse Rifle"
	desc = "A compact rifle with high magazine capacity and fire-rate. A novel design that replaces many common firearm \
		components with electrified alternatives, allowing a much smaller size for the firepower it provides. \
		This gives the weapon it's distinctive firing sound."
	icon = 'modular_lethal/paxilweapons_real/icons/rifle_32.dmi'
	icon_state = "karim"
	worn_icon = 'modular_lethal/paxilweapons_real/icons/onmob/guns_worn.dmi'
	worn_icon_state = "karim"
	lefthand_file = 'modular_lethal/paxilweapons_real/icons/onmob/guns_inhand_left.dmi'
	righthand_file = 'modular_lethal/paxilweapons_real/icons/onmob/guns_inhand_right.dmi'
	inhand_icon_state = "karim"
	special_mags = FALSE
	bolt_type = BOLT_TYPE_LOCKING
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BELT
	accepted_magazine_type = /obj/item/ammo_box/magazine/karim
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0.15 SECONDS
	actions_types = list()
	spread = 5
	recoil = 0.25
	pickup_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_mediumgun.wav'
	drop_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_mediumgun.wav'
	muzzleflash_iconstate = "muzzle_flash_pulse"
	/// List of the possible firing sounds
	var/list/firing_sound_list = list(
		'sound/items/weapons/gun/smartgun/smartgun_shoot_1.ogg',
		'sound/items/weapons/gun/smartgun/smartgun_shoot_2.ogg',
		'sound/items/weapons/gun/smartgun/smartgun_shoot_3.ogg',
	)
	gunshot_animation_information = list(
		"pixel_x" = 18, \
		"pixel_y" = 0, \
		"inactive_wben_suppressed" = TRUE, \
		"icon_state" = "pulseshot" \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -10, \
		"recoil_angle_lower" = -20, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
		"recoil_speed" = 0.5, \
		"return_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/karim/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, fire_delay)

/obj/item/gun/ballistic/automatic/karim/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_XHIHAO)

/obj/item/gun/ballistic/automatic/karim/fire_sounds()
	var/picked_fire_sound = pick(firing_sound_list)
	playsound(src, picked_fire_sound, fire_sound_volume, vary_fire_sound)

/obj/item/gun/ballistic/automatic/karim/no_mag
	spawnwithmagazine = FALSE
