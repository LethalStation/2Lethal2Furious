/obj/item/storage/epic_loot_grenade_case
	name = "explosives case"
	desc = "A thick-walled case for neatly storing away a collection of grenades. Keep away from fire."
	icon = 'modular_doppler/epic_loot/icons/storage_items.dmi'
	icon_state = "explosives"
	lefthand_file = 'icons/mob/inhands/equipment/briefcase_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/briefcase_righthand.dmi'
	inhand_icon_state = "lockbox"
	drop_sound = 'sound/items/handling/ammobox_drop.ogg'
	pickup_sound = 'sound/items/handling/ammobox_pickup.ogg'
	storage_type = /datum/storage/maintenance_loot_structure/epic_loot_grenade_box
	w_class = WEIGHT_CLASS_BULKY

/datum/storage/maintenance_loot_structure/epic_loot_grenade_box
	max_slots = 8
	max_specific_storage = WEIGHT_CLASS_NORMAL
	max_total_storage = WEIGHT_CLASS_NORMAL * 8
	screen_max_columns = 4
	numerical_stacking = FALSE
	opening_sound = 'modular_doppler/epic_loot/sound/wood_crate_1.mp3'

/datum/storage/maintenance_loot_structure/epic_loot_grenade_box/New()
	. = ..()

	can_hold = typecacheof(list(
		/obj/item/grenade,
		/obj/item/epic_loot/plasma_explosive,
		/obj/item/epic_loot/grenade_fuze,
	))
