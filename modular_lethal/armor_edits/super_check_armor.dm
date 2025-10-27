/datum/armor
	special_armor_value = SOFT_ARMOR_TYPE

/// Checks if a body zone is protected by hard armor or soft armor,
/mob/living/proc/get_zone_armor_type(obj/item/bodypart/def_zone)
	return

/mob/living/carbon/human/get_zone_armor_type(def_zone)
	if(def_zone)
		if(isbodypart(def_zone))
			var/obj/item/bodypart/bodypart = def_zone
			if(bodypart)
				return fetch_me_their_flexibility(def_zone)
		var/obj/item/bodypart/affecting = get_bodypart(check_zone(def_zone))
		if(affecting)
			return fetch_me_their_flexibility(affecting)
	for(var/X in bodyparts)
		var/obj/item/bodypart/all_bodypart = X
		if(fetch_me_their_flexibility(all_bodypart) == HARD_ARMOR_TYPE)
			return TRUE
		organnum++
	return FALSE

/// Compiles a list of all the armor types protecting a bodypart
/mob/living/carbon/human/proc/fetch_me_their_flexibility(obj/item/bodypart/def_zone)
	var/list/covering_clothing = list(head, wear_mask, wear_suit, w_uniform, back, gloves, shoes, belt, s_store, glasses, ears, wear_id, wear_neck)
	for(var/obj/item/clothing/clothing_item in covering_clothing)
		if(clothing_item.body_parts_covered & def_zone.body_part)
			if(clothing_item.armor.special_armor_value == HARD_ARMOR_TYPE)
				return TRUE // Hard armor is the most important bit to find here
	return FALSE
