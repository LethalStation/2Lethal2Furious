/obj/item/ammo_box/magazine/ammo_stack/c27_54cesarzowa
	name = ".27-54 Cesarzowa casings"
	desc = "A stack of .27-54 Cesarzowa cartridges."
	caliber = CALIBER_CESARZOWA
	ammo_type = /obj/item/ammo_casing/c27_54cesarzowa
	max_ammo = 18
	casing_w_spacing = 2
	casing_z_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/c27_54cesarzowa/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/c27_54cesarzowa/prefilled/tracer
	name = ".27-54 Cesarzowa tracer casings"
	ammo_type = /obj/item/ammo_casing/c27_54cesarzowa/tracer
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/c27_54cesarzowa/prefilled/ultrakill
	name = ".27-54 Cesarzowa ultrakill casings"
	ammo_type = /obj/item/ammo_casing/c27_54cesarzowa/ultrakill
	icon_state = "stack_spec"

// Magazine for the Miecz submachinegun

/obj/item/ammo_box/magazine/miecz
	name = "\improper Miecz submachinegun magazine"
	desc = "A standard size magazine for Miecz submachineguns, holds eighteen rounds."
	icon = 'modular_lethal/paxilweapons_real/icons/magazines_and_boxes.dmi'
	icon_state = "miecz_mag"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	ammo_type = /obj/item/ammo_casing/c27_54cesarzowa
	caliber = CALIBER_CESARZOWA
	max_ammo = 18

/obj/item/ammo_box/magazine/miecz/spawns_empty
	start_empty = TRUE
