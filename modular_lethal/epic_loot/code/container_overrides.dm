/obj/structure/maintenance_loot_structure/ammo_box
	name = "ammo crate"
	desc = "A small box for holding ammo away from the elements."
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/bullet_piles = 1,
		/obj/effect/spawner/random/epic_loot/magazines = 1,
	)

/obj/structure/maintenance_loot_structure/grenade_box
	name = "explosives crate"
	desc = "A reinforced box for holding things that explode."
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_explosives = 1,
	)

/obj/structure/maintenance_loot_structure/gun_box
	name = "weapon crate"
	desc = "A long weapons case for the safe shipping of firearms and accessories."
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_other_military_loot = 2,
		/obj/effect/spawner/random/epic_loot/bullet_piles = 1,
		/obj/effect/spawner/random/epic_loot/magazines = 1,
		/obj/effect/spawner/random/epic_loot/war = 2,
	)

/obj/structure/maintenance_loot_structure/large_crate/military
	name = "reinforced transport crate"
	desc = "A large crate for transporting equally large amounts of military hardware."
	icon_state = "supplydrop_green"
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_other_military_loot = 1,
		/obj/effect/spawner/random/epic_loot/medical_everything = 1,
		/obj/effect/spawner/random/epic_loot/bullet_piles = 1,
		/obj/effect/spawner/random/epic_loot/magazines = 1,
		/obj/effect/spawner/random/epic_loot/war = 1,
	)

/obj/structure/maintenance_loot_structure/military_case
	name = "military shipping crate"
	desc = "A reinforced shipping crate for the transport of military hardware."
	loot_weighted_list = list(
		/obj/effect/spawner/random/epic_loot/random_other_military_loot = 1,
		/obj/effect/spawner/random/epic_loot/medical_everything = 1,
		/obj/effect/spawner/random/epic_loot/bullet_piles = 1,
		/obj/effect/spawner/random/epic_loot/magazines = 1,
		/obj/effect/spawner/random/epic_loot/war = 1,
	)
