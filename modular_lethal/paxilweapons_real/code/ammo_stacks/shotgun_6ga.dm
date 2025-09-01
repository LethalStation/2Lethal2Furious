/obj/item/ammo_box/magazine/ammo_stack/s6gauge
	name = "6 gauge shells"
	desc = "A stack of 6 gauge shells."
	caliber = CALIBER_6GAUGE
	ammo_type = /obj/item/ammo_casing/s6gauge
	max_ammo = 4
	casing_w_spacing = 4
	casing_z_padding = 9

/obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled
	name = "6 gauge buckshot shells"
	start_empty = FALSE

/obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled/longshot
	name = "6 gauge longshot shells"
	ammo_type = /obj/item/ammo_casing/s6gauge/longshot
	icon_state = "stack_spec"

/obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled/slug
	name = "6 gauge slug shells"
	ammo_type = /obj/item/ammo_casing/s6gauge/slug

/obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled/flash
	name = "6 gauge flash shells"
	icon_state = "stack_spec"
	ammo_type = /obj/item/ammo_casing/s6gauge/flashbang

// Internal shotgun tube for 6 gauge shotguns

/obj/item/ammo_box/magazine/internal/s6gauge
	name = "6 gauge shotgun internal magazine"
	ammo_type = /obj/item/ammo_casing/s6gauge
	caliber = CALIBER_6GAUGE
	max_ammo = 3
	ammo_box_multiload = AMMO_BOX_MULTILOAD_NONE

/obj/item/ammo_box/magazine/internal/s6gauge/starts_empty
	start_empty = TRUE
