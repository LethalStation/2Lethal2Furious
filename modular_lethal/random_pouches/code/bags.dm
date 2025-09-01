/// Base pouch type. Fits in pockets, as its main gimmick.
/obj/item/storage/pouch
	name = "storage pouch"
	desc = "It's a nondescript pouch made with dark fabric. It has a clip, for fitting in pockets."
	icon = 'modular_lethal/random_pouches/icons/storage.dmi'
	icon_state = "survival"
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_POCKETS

/obj/item/storage/pouch/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 5

/obj/item/storage/pouch/ammo
	name = "ammo pouch"
	desc = "A pouch for your ammo that goes in your pocket."
	icon = 'modular_lethal/random_pouches/icons/storage.dmi'
	icon_state = "ammopouch"
	w_class = WEIGHT_CLASS_BULKY
	custom_price = PAYCHECK_CREW * 4
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Ammo Pouch" = list(
			RESKIN_ICON_STATE = "ammopouch"
		),
		"Casing Pouch" = list(
			RESKIN_ICON_STATE = "casingpouch"
		),
	)

/obj/item/storage/pouch/ammo/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 12
	atom_storage.max_slots = 3
	atom_storage.numerical_stacking = FALSE
	atom_storage.can_hold = typecacheof(list(/obj/item/ammo_box/magazine, /obj/item/ammo_casing))

/obj/item/storage/pouch/ammo/post_reskin(mob/our_mob)
	if(icon_state == "casingpouch")
		name = "casing pouch"
		desc = "A pouch for your ammo that goes in your pocket, carefully segmented for holding shell casings and nothing else."
		atom_storage.can_hold = typecacheof(list(/obj/item/ammo_casing))
		atom_storage.max_specific_storage = WEIGHT_CLASS_TINY
		atom_storage.numerical_stacking = TRUE
		atom_storage.max_slots = 10
		atom_storage.max_total_storage = WEIGHT_CLASS_TINY * 10

/obj/item/storage/pouch/medical
	name = "medkit pouch"
	desc = "A standard medkit pouch compartmentalized for field medical care. Comes with a set of pocket clips."
	resistance_flags = FIRE_PROOF
	icon_state = "medkit"
	var/static/list/med_pouch_holdables = list(
		/obj/item/healthanalyzer,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/cup/beaker,
		/obj/item/reagent_containers/cup/bottle,
		/obj/item/reagent_containers/cup/tube,
		/obj/item/reagent_containers/applicator,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/medigel,
		/obj/item/reagent_containers/spray,
		/obj/item/reagent_containers/hypospray,
		/obj/item/storage/pill_bottle,
		/obj/item/storage/box/bandages,
		/obj/item/stack/medical,
		/obj/item/flashlight/pen,
		/obj/item/bonesetter,
		/obj/item/cautery,
		/obj/item/hemostat,
		/obj/item/reagent_containers/blood,
		/obj/item/stack/sticky_tape,
	)

/obj/item/storage/pouch/medical/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_slots = 7
	atom_storage.max_total_storage = 14
	atom_storage.set_holdable(med_pouch_holdables)

/obj/item/storage/pouch/medical/loaded/Initialize(mapload)
	. = ..()
	var/static/items_inside = list(
		/obj/item/stack/medical/gauze/twelve = 1,
		/obj/item/stack/medical/suture = 2,
		/obj/item/stack/medical/mesh = 2,
		/obj/item/reagent_containers/hypospray/medipen = 1,
		/obj/item/healthanalyzer/simple = 1,
	)
	generate_items_inside(items_inside, src)

/obj/item/storage/pouch/medical/firstaid
	name = "first aid pouch"
	desc = "A standard nondescript first-aid pouch, compartmentalized for the bare essentials of field medical care. Comes with a pocket clip."
	icon_state = "firstaid"

/obj/item/storage/pouch/medical/firstaid/Initialize(mapload)
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_slots = 5
	atom_storage.max_total_storage = 10

/obj/item/storage/pouch/medical/firstaid/loaded/Initialize(mapload)
	. = ..()
	var/static/items_inside = list(
		/obj/item/stack/medical/suture = 1,
		/obj/item/stack/medical/mesh = 1,
		/obj/item/storage/box/bandages = 1,
		/obj/item/stack/medical/gauze/twelve = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 1,
	)
	generate_items_inside(items_inside, src)

/obj/item/storage/pouch/medical/firstaid/stabilizer/Initialize(mapload)
	. = ..()
	var/static/items_inside = list(
		/obj/item/cautery = 1,
		/obj/item/bonesetter = 1,
		/obj/item/stack/medical/gauze/twelve = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 2,
	)
	generate_items_inside(items_inside, src)

/obj/item/storage/pouch/medical/firstaid/advanced/Initialize(mapload)
	. = ..()
	var/static/items_inside = list(
		/obj/item/stack/medical/suture/medicated = 2,
		/obj/item/stack/medical/mesh/advanced = 1,
		/obj/item/stack/medical/gauze/twelve = 1,
		/obj/item/reagent_containers/hypospray/medipen/ekit = 1,
	)
	generate_items_inside(items_inside, src)
