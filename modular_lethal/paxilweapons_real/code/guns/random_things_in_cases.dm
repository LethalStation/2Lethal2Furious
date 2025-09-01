// Nomi in a case

/obj/item/storage/toolbox/guncase/doppla/nomi_shotgun
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/nomi_shotgun
	extra_to_spawn = /obj/item/ammo_box/magazine/c12nomi

// Boxed ramu

/obj/item/storage/toolbox/guncase/doppla/super_shotgun
	weapon_to_spawn = /obj/item/gun/ballistic/shotgun/ramu
	extra_to_spawn = /obj/item/ammo_box/magazine/ammo_stack/s6gauge/prefilled

// Sindano in a box, how innovative!

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/sindano
	name = "\improper Carwo 'Sindano' gunset"

	weapon_to_spawn = /obj/item/gun/ballistic/automatic/sol_smg/no_mag
	extra_to_spawn = /obj/item/ammo_box/magazine/c35sol_pistol/stendo

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/sindano/PopulateContents()
	new weapon_to_spawn (src)

	generate_items_inside(list(
		/obj/item/ammo_box/magazine/ammo_stack/c35_sol/prefilled/tracer = 1,
		/obj/item/ammo_box/magazine/ammo_stack/c35_sol/prefilled = 1,
		/obj/item/ammo_box/magazine/c35sol_pistol/stendo/starts_empty = 1,
		/obj/item/ammo_box/magazine/c35sol_pistol/starts_empty = 2,
	), src)

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/sindano/evil
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/sol_smg/no_mag

// Boxed grenade launcher, grenades sold seperately on this one

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/kiboko_magless
	name = "\improper Carwo 'Kiboko' gunset"

	weapon_to_spawn = /obj/item/gun/ballistic/automatic/sol_grenade_launcher/no_mag
	extra_to_spawn = /obj/item/ammo_box/magazine/c980_grenade/starts_empty

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/thunderdome_kiboko
	name = "\improper Carwo 'Kiboko' gunset"

	weapon_to_spawn = /obj/item/gun/ballistic/automatic/sol_grenade_launcher/no_mag
	extra_to_spawn = /obj/item/ammo_box/magazine/c980_grenade/starts_empty

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/thunderdome_kiboko/PopulateContents()
	new weapon_to_spawn (src)

	generate_items_inside(list(
		/obj/item/ammo_box/magazine/c980_grenade = 1,
		/obj/item/ammo_box/magazine/c980_grenade = 1,
		/obj/item/ammo_box/magazine/c980_grenade = 1,
	), src)

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/thunderdome_kiboko/evil
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/sol_grenade_launcher/evil/no_mag

/obj/item/storage/toolbox/guncase/doppla/carwo_large_case/thunderdome_kiboko/evil/PopulateContents()
	new weapon_to_spawn (src)

	generate_items_inside(list(
		/obj/item/ammo_box/magazine/c980_grenade/drum = 1,
		/obj/item/ammo_box/magazine/c980_grenade/drum = 1,
		/obj/item/ammo_box/magazine/c980_grenade/drum = 1,
	), src)

// It doesn't miss

/obj/item/gun/ballistic/shotgun/riot/sol/thunderdome
	spawn_magazine_type = /obj/item/ammo_box/magazine/internal/shot/riot/sol/thunderdome

/obj/item/ammo_box/magazine/internal/shot/riot/sol/thunderdome
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge

/obj/item/gun/ballistic/shotgun/riot/sol/evil/thunderdome
	spawn_magazine_type = /obj/item/ammo_box/magazine/internal/shot/riot/sol/thunderdome/evil

/obj/item/ammo_box/magazine/internal/shot/riot/sol/thunderdome/evil
	ammo_type = /obj/item/ammo_casing/lethal_s12gauge/flechette
