// Bow

/obj/item/gun/ballistic/bow/rimworld
	name = "longbow"
	desc = "A longbow, for throwing rocks at your enemies really fast."
	icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/objects.dmi'
	lefthand_file = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/lefthand.dmi'
	righthand_file = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/righthand.dmi'
	worn_icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/worn.dmi'
	icon_state = "bow"
	inhand_icon_state = "bow"
	base_icon_state = "bow"
	worn_icon_state = "bow"
	slot_flags = ITEM_SLOT_BACK
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/bow/rimworld
	projectile_damage_multiplier = 1
	load_sound = 'sound/items/weapons/draw_bow.ogg'
	pickup_sound = 'sound/items/handling/materials/wood_pick_up.ogg'
	drop_sound = 'sound/items/handling/materials/wood_drop.ogg'

/obj/item/ammo_box/magazine/internal/bow/rimworld
	name = "bowstring"
	ammo_type = /obj/item/ammo_casing/arrow/rimworld

// Quiver

/obj/item/storage/bag/quiver/rimworld
	name = "quiver"
	desc = "Holds arrows for your divine bow, where they wait to find their target."
	icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/objects.dmi'
	worn_icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/worn.dmi'
	icon_state = "quiver"
	inhand_icon_state = null
	worn_icon_state = "quiver"
	arrow_path = /obj/item/ammo_casing/arrow/rimworld

/obj/item/storage/bag/quiver/rimworld/full

/obj/item/storage/bag/quiver/rimworld/full/PopulateContents()
	. = ..()
	for(var/i in 1 to 10)
		new arrow_path(src)

// Arrow

/obj/item/ammo_casing/arrow/rimworld
	name = "arrow"
	desc = "The finest in rock slinging technology."
	icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/ammo.dmi'
	lefthand_file = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/lefthand.dmi'
	righthand_file = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/righthand.dmi'
	icon_state = "stone_arrow"
	inhand_icon_state = "knife"
	base_icon_state = "stone_arrow"
	worn_icon_state = null
	projectile_type = /obj/projectile/bullet/arrow/rimworld
	pickup_sound = 'sound/items/handling/gun/ballistics/magazine/magazine_pickup1.ogg'
	drop_sound = 'sound/items/handling/gun/ballistics/magazine/magazine_drop1.ogg'

/obj/projectile/bullet/arrow/rimworld
	name = "arrow"
	desc = "Just dodge, dude."
	icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/ammo.dmi'
	icon_state = "stone_arrow_projectile"
	damage = 25

// 3x arrow spawner

/obj/effect/spawner/random/rimworld_arrows
	name = "rimworld stone arrow spawner"
	loot = list(
		/obj/item/ammo_casing/arrow/rimworld
	)
	spawn_loot_count = 3
	spawn_loot_split = TRUE
