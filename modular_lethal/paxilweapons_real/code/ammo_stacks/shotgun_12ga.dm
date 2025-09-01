/obj/item/ammo_box/magazine/ammo_stack/s12gauge
	name = "12 gauge shells"
	desc = "A stack of 12 gauge shells."
	caliber = CALIBER_SHOTGUN
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge
	casing_phrasing = "shell"
	max_ammo = 8
	casing_w_spacing = 3
	casing_z_padding = 4

/obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled
	name = "12 gauge pelletshot shells"
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/flechette
	name = "12 gauge flechette shells"
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge/flechette
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/shrapnel
	name = "12 gauge shrapnel shells"
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge/shrapnel
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/ecm
	name = "12 gauge ECM chaff shells"
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge/ecm_can
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/slug
	name = "12 gauge slug shells"
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge/slug

/obj/item/ammo_box/magazine/ammo_stack/s12gauge/prefilled/ap_slug
	name = "12 gauge AP slug shells"
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge/slug/penetration
	icon_state = "stack_spec"

// Shotgun revolver's cylinder

/obj/item/ammo_box/magazine/internal/cylinder/rev12ga
	name = "\improper 12 GA revolver cylinder"
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge
	caliber = CALIBER_SHOTGUN
	max_ammo = 4
	ammo_box_multiload = AMMO_BOX_MULTILOAD_NONE

// 12ga drum for the nomi semi-automatic shotgun

/obj/item/ammo_box/magazine/c12nomi
	name = "\improper Nomi 12ga drum"
	desc = "A large drum for the Nomi repeating shotgun that fits 12ga shotgun shells within. \
		Holds ten shells."
	icon = 'modular_lethal/paxilweapons_real/icons/magazines_and_boxes.dmi'
	icon_state = "nomi_mag"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge
	caliber = CALIBER_SHOTGUN
	max_ammo = 10

/obj/item/ammo_box/magazine/c12nomi/starts_empty
	start_empty = TRUE

// 12ga tube for the riot shotguns

/obj/item/ammo_box/magazine/internal/shot/riot/sol
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge
