/obj/item/ammo_box/magazine/ammo_stack/c980
	name = ".980 Tydhouer grenades"
	desc = "A stack of .980 Tydhouer grenades."
	icon_state = "stack_spec"
	caliber = CALIBER_980TYDHOUER
	ammo_type = /obj/item/ammo_casing/c980grenade
	casing_phrasing = "shell"
	max_ammo = 6
	casing_w_spacing = 3
	casing_z_padding = 9

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled
	name = ".980 Tydhouer HEDP grenades"
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/aphe
	name = ".980 Tydhouer APHE grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/aphe

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/thermobaric
	name = ".980 Tydhouer thermobaric grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/thermobaric

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/shrapnel
	name = ".980 Tydhouer shrapnel grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/shrapnel

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/ecm
	name = ".980 Tydhouer ECM chaff grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/ecm

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/flechette
	name = ".980 Tydhouer flechette grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/flechette

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/phosphor
	name = ".980 Tydhouer phosphor grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/shrapnel/phosphor

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/sabot
	name = ".980 Tydhouer sabot grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/sabot

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/beacon
	name = ".980 Tydhouer jamming beacon grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/beacon

/obj/item/ammo_box/magazine/ammo_stack/c980/prefilled/smoke
	name = ".980 Tydhouer smoke grenades"
	ammo_type = /obj/item/ammo_casing/c980grenade/smoke

// .980 grenade magazines

/obj/item/ammo_box/magazine/c980_grenade
	name = "\improper Kiboko grenade box"
	desc = "A standard size box for .980 grenades, holds four shells."
	icon = 'modular_lethal/paxilweapons_real/icons/magazines_and_boxes.dmi'
	icon_state = "kiboko_standard"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_SMALL
	ammo_type = /obj/item/ammo_casing/c980grenade
	caliber = CALIBER_980TYDHOUER
	max_ammo = 4

/obj/item/ammo_box/magazine/c980_grenade/chill_out
	ammo_type = /obj/item/ammo_casing/c980grenade/flechette

/obj/item/ammo_box/magazine/c980_grenade/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c980_grenade/drum
	name = "\improper Kiboko grenade drum"
	desc = "A drum for .980 grenades, holds six shells."
	icon_state = "kiboko_drum"
	w_class = WEIGHT_CLASS_NORMAL
	max_ammo = 6

/obj/item/ammo_box/magazine/c980_grenade/drum/chill_out
	ammo_type = /obj/item/ammo_casing/c980grenade/flechette

/obj/item/ammo_box/magazine/c980_grenade/drum/starts_empty
	start_empty = TRUE
