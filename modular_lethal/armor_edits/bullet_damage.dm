/// Checks the armor that the person is wearing when they are attacked and damages it under the correct conditions
/mob/living/proc/damage_armor(damage = 0, damage_type = BRUTE, def_zone = BODY_ZONE_CHEST)
	return FALSE

/mob/living/carbon/human/damage_armor(damage = 0, damage_type = BRUTE, def_zone = BODY_ZONE_CHEST)
	var/obj/item/bodypart/affecting
	if(def_zone)
		if(isbodypart(def_zone))
			affecting = def_zone
		else
			affecting = get_bodypart(check_zone(def_zone))

	if(!affecting)
		return FALSE

	var/list/clothings = get_clothing_on_part(affecting)
	for(var/obj/item/clothing/clothing in clothings)
		if(clothing.take_damage_zone(def_zone, damage, damage_type, 100))
			return TRUE

	return FALSE

// Override of living apply_projectile_effects that also damages the armor someone is wearing

/mob/living/apply_projectile_effects(obj/projectile/proj, def_zone, armor_check)
	var/hard_protection = get_zone_armor_type(def_zone)
	var/used_armor_block = armor_check
	if(hard_protection)
		switch(used_armor_block)
			if(-INFINITY to 50)
				used_armor_block = 75
			if(51 to 75)
				used_armor_block = 50
			else
				used_armor_block = 25
	apply_damage(
		damage = hard_protection ? (max(proj.damage - (armor_check / 4), 0)) : proj.damage,
		damagetype = proj.damage_type,
		def_zone = def_zone,
		blocked = hard_protection ? used_armor_block : armor_check,
		wound_bonus = proj.wound_bonus,
		exposed_wound_bonus = proj.exposed_wound_bonus,
		sharpness = proj.sharpness,
		attack_direction = get_dir(proj.starting, src),
	)
	apply_effects(
		stun = proj.stun,
		knockdown = proj.knockdown,
		unconscious = proj.unconscious,
		slur = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : proj.slur, // Don't want your cyborgs to slur from being ebow'd
		stutter = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : proj.stutter, // Don't want your cyborgs to stutter from being tazed
		eyeblur = proj.eyeblur,
		drowsy = proj.drowsy,
		blocked = armor_check,
		stamina = proj.stamina,
		jitter = (mob_biotypes & MOB_ROBOTIC) ? 0 SECONDS : proj.jitter, // Cyborgs can jitter but not from being shot
		paralyze = proj.paralyze,
		immobilize = proj.immobilize,
	)
	// If the damage type isn't one of the types that already does clothing damage, then we damage armor
	damage_armor(proj.damage, proj.damage_type, def_zone)
	if(proj.dismemberment)
		check_projectile_dismemberment(proj, def_zone)
	if(proj.damage && armor_check < 100)
		create_projectile_hit_effects(proj, def_zone, armor_check)

// Override take_damage_zone to allow stuff with only one covered zone to take damage
/obj/item/clothing/proc/take_damage_zone(def_zone, damage_amount, damage_type, armour_penetration)
	if(!def_zone || !limb_integrity) // the second check sees if we only cover one bodypart anyway and don't need to bother with this
		return
	var/list/covered_limbs = cover_flags2body_zones(body_parts_covered) // what do we actually cover?
	if(!(def_zone in covered_limbs))
		return
	var/damage_dealt = take_damage(damage_amount / 2, damage_type, "", FALSE, 1, 100) * 2
	LAZYINITLIST(damage_by_parts)
	damage_by_parts[def_zone] += damage_dealt
	if(damage_by_parts[def_zone] > limb_integrity)
		disable_zone(def_zone, damage_type)

/mob/living/attacked_by(obj/item/attacking_item, mob/living/user, list/modifiers, list/attack_modifiers)
	var/targeting = check_zone(user.zone_selected)
	if(user != src)
		var/zone_hit_chance = 80
		if(body_position == LYING_DOWN)
			zone_hit_chance += 10
		targeting = get_random_valid_zone(targeting, zone_hit_chance)
	var/targeting_human_readable = parse_zone_with_bodypart(targeting)
	if(!LAZYACCESS(attack_modifiers, SILENCE_DEFAULT_MESSAGES))
		send_item_attack_message(attacking_item, user, targeting_human_readable, targeting)
	var/armor_block = min(run_armor_check(
			def_zone = targeting,
			attack_flag = MELEE,
			absorb_text = span_notice("Your armor has protected your [targeting_human_readable]!"),
			soften_text = span_warning("Your armor has softened a hit to your [targeting_human_readable]!"),
			armour_penetration = attacking_item.armour_penetration,
			weak_against_armour = attacking_item.weak_against_armour,
		), ARMOR_MAX_BLOCK)
	var/final_force = CALCULATE_FORCE(attacking_item, attack_modifiers)
	if(mob_biotypes & MOB_ROBOTIC)
		final_force *= attacking_item.get_demolition_modifier(src)
	var/wounding = attacking_item.wound_bonus
	if((attacking_item.item_flags & SURGICAL_TOOL) && !user.combat_mode && body_position == LYING_DOWN && (LAZYLEN(surgeries) > 0))
		wounding = CANT_WOUND
	if(user != src)
		// This doesn't factor in armor, or most damage modifiers (physiology). Your mileage may vary
		if(check_block(attacking_item, final_force, "\the [attacking_item]", MELEE_ATTACK, attacking_item.armour_penetration, attacking_item.damtype))
			return ATTACK_FAILED
	SEND_SIGNAL(attacking_item, COMSIG_ITEM_ATTACK_ZONE, src, user, targeting)
	if(final_force <= 0)
		return 0
	if(ishuman(src) || client) // istype(src) is kinda bad, but it's to avoid spamming the blackbox
		SSblackbox.record_feedback("nested tally", "item_used_for_combat", 1, list("[attacking_item.force]", "[attacking_item.type]"))
		SSblackbox.record_feedback("tally", "zone_targeted", 1, user.zone_selected)
	var/hard_protection = get_zone_armor_type(targeting)
	var/stored_force = final_force
	var/used_armor_block = armor_block
	if(hard_protection)
		switch(used_armor_block)
			if(-INFINITY to 50)
				used_armor_block = 75
			if(51 to 75)
				used_armor_block = 50
			else
				used_armor_block = 25
		final_force = max((final_force - (armor_block / 4)), 0)
	var/damage_done = apply_damage(
		damage = final_force,
		damagetype = attacking_item.damtype,
		def_zone = targeting,
		blocked = hard_protection ? used_armor_block : armor_block,
		wound_bonus = wounding,
		exposed_wound_bonus = attacking_item.exposed_wound_bonus,
		sharpness = attacking_item.get_sharpness(),
		attack_direction = get_dir(user, src),
		attacking_item = attacking_item,
	)
	damage_armor(stored_force, attacking_item.damtype, targeting)
	attack_effects(damage_done, targeting, armor_block, attacking_item, user)
	return damage_done
