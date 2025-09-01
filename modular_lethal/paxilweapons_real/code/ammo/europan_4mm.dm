// 4mm Europan
// Small caseless bullet for the pulse rifle

/obj/item/ammo_casing/europan4mm
	name = "4mm Europan casing"
	desc = "A small caseless round for use in the Karim Electrics pulse rifle."
	icon = 'modular_lethal/paxilweapons_real/icons/casings.dmi'
	icon_state = "4mm_europa"
	caliber = CALIBER_4MMEUROPAN
	ammo_stack_type = /obj/item/ammo_box/magazine/ammo_stack/europan4mm
	projectile_type = /obj/projectile/bullet/europan4mm

/obj/item/ammo_casing/europan4mm/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/caseless)

/obj/projectile/bullet/europan4mm
	name = "4mm bullet"
	icon = 'modular_lethal/paxilweapons_real/icons/projectiles.dmi'
	damage = 18
	speed = 1.5
