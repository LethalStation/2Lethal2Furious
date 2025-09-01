/obj/item/ammo_box/magazine/ammo_stack/c40_sol
	name = ".40 Sol Long casings"
	desc = "A stack of .40 Sol Long cartridges."
	caliber = CALIBER_SOL40LONG
	ammo_type = /obj/item/ammo_casing/c40sol
	max_ammo = 15
	casing_w_spacing = 2
	casing_z_padding = 6

/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled/hardcore
	name = ".40 Sol Long hardcore casings"
	ammo_type = /obj/item/ammo_casing/c40sol/hardcore
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/c40_sol/prefilled/tracer
	name = ".40 Sol Long tracer casings"
	ammo_type = /obj/item/ammo_casing/c40sol/tracer
	icon_state = "stack_spec"

// .40 Sol rifle magazines

/obj/item/ammo_box/magazine/c40sol_rifle
	name = "\improper Sol rifle short magazine"
	desc = "A shortened magazine for SolFed rifles, holds fifteen rounds."
	icon = 'modular_lethal/paxilweapons_real/icons/magazines_and_boxes.dmi'
	icon_state = "rifle_short"
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_TINY
	ammo_type = /obj/item/ammo_casing/c40sol
	caliber = CALIBER_SOL40LONG
	max_ammo = 15

/obj/item/ammo_box/magazine/c40sol_rifle/starts_empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/c40sol_rifle/standard
	name = "\improper Sol rifle magazine"
	desc = "A standard size magazine for SolFed rifles, holds thirty rounds."
	icon_state = "rifle_standard"
	w_class = WEIGHT_CLASS_SMALL
	max_ammo = 30

/obj/item/ammo_box/magazine/c40sol_rifle/standard/starts_empty
	start_empty = TRUE
