/obj/item/ammo_box/magazine/ammo_stack/c310_strilka
	name = ".310 Strilka casings"
	desc = "A stack of .310 Strilka cartridges."
	caliber = CALIBER_STRILKA310
	ammo_type = /obj/item/ammo_casing/strilka310
	max_ammo = 5
	casing_w_spacing = 2
	casing_z_padding = 8

/obj/item/ammo_box/magazine/ammo_stack/c310_strilka/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/c310_strilka/prefilled/tracer
	name = ".310 Strilka tracer casings"
	ammo_type = /obj/item/ammo_casing/strilka310/tracer
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/c310_strilka/prefilled/piercing
	name = ".310 Strilka piercing casings"
	ammo_type = /obj/item/ammo_casing/strilka310/piercing
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/c310_strilka/prefilled/kedown
	name = ".310 Strilka 'Kedown' casings"
	ammo_type = /obj/item/ammo_casing/strilka310/kedown
	icon_state = "stack_spec"

// .310 magazine for the Lanca rifle

/obj/item/ammo_box/magazine/lanca
	name = "\improper Lanca rifle magazine"
	desc = "A standard size magazine for Lanca rifles, holds five rounds."
	icon = 'modular_lethal/paxilweapons_real/icons/magazines_and_boxes.dmi'
	icon_state = "lanca_mag"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/strilka310
	caliber = CALIBER_STRILKA310
	max_ammo = 5

/obj/item/ammo_box/magazine/lanca/spawns_empty
	start_empty = TRUE
