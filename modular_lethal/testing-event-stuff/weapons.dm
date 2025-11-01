/obj/item/melee/tizirian_sword/no_ap
	armour_penetration = 0

/obj/item/forging/reagent_weapon/spear/lethal
	name = "spear"
	force = 13
	armour_penetration = 0
	wound_bonus = 0
	block_chance = 0
	sharpness = SHARP_POINTY

/obj/item/forging/reagent_weapon/spear/lethal/lizard
	custom_materials = list(/datum/material/lizard_bronze = SHEET_MATERIAL_AMOUNT)

/obj/item/forging/reagent_weapon/spear/lethal/tajaran
	custom_materials = list(/datum/material/vulp_steel = SHEET_MATERIAL_AMOUNT)

/obj/item/forging/reagent_weapon/spear/lethal/get_attack_anim_type(secondary)
	return ATTACK_ANIMATION_PIERCE

/obj/item/forging/reagent_weapon/spear/lethal/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user)

/obj/item/forging/reagent_weapon/spear/lethal/ranged_interact_with_atom_secondary(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user)

/obj/item/forging/reagent_weapon/spear/lethal/get_targets(mob/living/attacker, direction, backwards, target)
	return get_turfs_in_straight_line_toward(attacker, target, 2)

/obj/item/forging/reagent_weapon/axe/lethal
	name = "axe"
	desc = "An axe made for KILLING PEOPLE have you tried KILLING PEOPLE. It's not for cutting wood it's for cutting PEOPLE!!"
	force = 16
	armour_penetration = 0
	throwforce = 18
	throw_speed = 4

/obj/item/forging/reagent_weapon/axe/lethal/tajaran
	custom_materials = list(/datum/material/vulp_steel = SHEET_MATERIAL_AMOUNT)

/obj/item/forging/reagent_weapon/axe/lethal/get_attack_anim_type(secondary)
	return ATTACK_ANIMATION_SLASH

/obj/item/forging/reagent_weapon/axe/lethal/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user)

/obj/item/forging/reagent_weapon/axe/lethal/ranged_interact_with_atom_secondary(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user, TRUE, TRUE)

/obj/item/forging/reagent_weapon/axe/lethal/get_targets(mob/living/attacker, direction, backwards, target)
	return get_turfs_and_adjacent_in_direction(attacker, direction, backwards)

/obj/item/shield/buckler/reagent_weapon/lethal
	name = "buckler shield"
	custom_materials = list(/datum/material/vulp_steel = HALF_SHEET_MATERIAL_AMOUNT)
	block_chance = 25
	max_integrity = 100
	shield_break_leftover = /obj/effect/decal/cleanable/rubble

/obj/item/shield/buckler/reagent_weapon/lethal/get_attack_anim_type(secondary)
	return ATTACK_ANIMATION_BLUNT

/obj/item/shield/buckler/reagent_weapon/lethal/ranged_interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user)

/obj/item/shield/buckler/reagent_weapon/lethal/ranged_interact_with_atom_secondary(atom/interacting_with, mob/living/user, list/modifiers)
	return start_swing_attack(interacting_with, user, TRUE, TRUE)

/obj/item/shield/buckler/reagent_weapon/lethal/get_targets(mob/living/attacker, direction, backwards, target)
	return get_step_towards(attacker, target)

/obj/item/shield/buckler/reagent_weapon/lethal/big
	name = "tower shield"
	desc = "A tall shield for a tall Tizirian, the last thing you want to see in front of you in a small tunnel."
	icon_state = "pavise"
	inhand_icon_state = "pavise"
	worn_icon_state = "pavise_back"
	block_chance = 25
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK
	max_integrity = 150
	custom_materials = list(/datum/material/lizard_bronze = SHEET_MATERIAL_AMOUNT)
