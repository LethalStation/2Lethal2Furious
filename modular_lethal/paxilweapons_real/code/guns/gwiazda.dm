// Plasma sharpshooter pistol
// Shoots single, strong plasma blasts at a slow rate

/obj/item/gun/ballistic/automatic/pistol/plasma_marksman
	name = "\improper Gwiazda Plasma Sharpshooter"
	desc = "An old plasma pistol powered by battery packs, from before the common consensus came to be \
		that \"Just shoot them\" works a lot better than most fancy technology ever did in remote places like this."
	icon = 'modular_lethal/paxilweapons_real/icons/pistol_32.dmi'
	icon_state = "gwiazda"
	fire_sound = 'modular_lethal/paxilweapons_real/sound/laser_firing/burn.ogg'
	fire_sound_volume = 40 // This thing is comically loud otherwise
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/recharge/plasma_battery
	can_suppress = FALSE
	show_bolt_icon = FALSE
	casing_ejector = FALSE
	empty_indicator = FALSE
	bolt_type = BOLT_TYPE_OPEN
	fire_delay = 0.6 SECONDS
	spread = 2.5
	recoil = 0.25
	projectile_damage_multiplier = 2 //30 damage a shot
	projectile_wound_bonus = 10 // +55 of the base projectile, burn baby burn
	pickup_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_lightgun.wav'
	drop_sound = 'modular_lethal/paxilweapons_real/sound/pickup_sounds/drop_lightgun.wav'
	gunshot_animation_information = list(
		"pixel_x" = 15, \
		"pixel_y" = 3, \
		"inactive_wben_suppressed" = TRUE, \
		"icon_state" = "plasmashot" \
	)
	recoil_animation_information = list(
		"recoil_angle_upper" = -15, \
		"recoil_angle_lower" = -30, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/pistol/plasma_marksman/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_SZOT)
