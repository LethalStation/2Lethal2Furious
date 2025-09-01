// Variant of the suppressed rifle with a scope and perfect accuracy, also no automatic

/obj/item/gun/ballistic/automatic/suppressed_rifle/marksman
	name = "\improper Ransu suppressed marksman rifle"
	desc = "A special rifle firing 8mm Marsian out of an integrally suppressed barrel. Uses special Ransu magazines. \
		This one is mounted with a scope and other furniture to support more long range action."
	icon_state = "ransu"
	worn_icon_state = "ransu"
	inhand_icon_state = "ransu"
	spawn_magazine_type = /obj/item/ammo_box/magazine/c8marsian
	accepted_magazine_type = /obj/item/ammo_box/magazine/c8marsian
	load_sound = 'modular_lethal/paxilweapons_real/sound/yari/yari_magin.wav'
	rack_sound = 'modular_lethal/paxilweapons_real/sound/ransu/ransu_rack.wav'
	fire_sound = 'modular_lethal/paxilweapons_real/sound/ransu/ransu.wav'
	suppressed_sound = 'modular_lethal/paxilweapons_real/sound/ransu/ransu.wav'
	special_mags = FALSE
	can_suppress = TRUE
	can_unsuppress = FALSE
	fire_delay = 1.5 SECONDS
	spread = 0
	projectile_damage_multiplier = 1
	recoil = 0.5
	recoil_animation_information = list(
		"recoil_angle_upper" = -10, \
		"recoil_angle_lower" = -20, \
		"recoil_burst_speed" = 0.5, \
		"return_burst_speed" = 0.5, \
	)

/obj/item/gun/ballistic/automatic/suppressed_rifle/marksman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/scope, range_modifier = 2)

/obj/item/gun/ballistic/automatic/suppressed_rifle/marksman/add_bayonet_point()
	return

/obj/item/gun/ballistic/automatic/suppressed_rifle/marksman/give_autofire()
	return

/obj/item/gun/ballistic/automatic/suppressed_rifle/marksman/starts_empty
	spawnwithmagazine = FALSE
