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
	var/flat_reduction = (getarmor(def_zone, proj.armor_flag) / 5) * ((100 - proj.armour_penetration) / 100)
	var/armor_damage = proj.damage - (proj.damage - flat_reduction)

	apply_damage(
		damage = max(0, proj.damage - flat_reduction),
		damagetype = proj.damage_type,
		def_zone = def_zone,
		blocked = min(ARMOR_MAX_BLOCK, armor_check - armor_damage),  //cap damage reduction at 90%
		wound_bonus = proj.wound_bonus,
		bare_wound_bonus = proj.bare_wound_bonus,
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
	if(proj.damage_type != BURN)
		damage_armor(
			armor_damage,
			proj.damage_type,
			def_zone,
		)

	if(proj.dismemberment)
		check_projectile_dismemberment(proj, def_zone)

	if (proj.damage && armor_check < 100)
		create_projectile_hit_effects(proj, def_zone, armor_check)

// Override take_damage_zone to allow stuff with only one covered zone to take damage
/obj/item/clothing/proc/take_damage_zone(def_zone, damage_amount, damage_type, armour_penetration)
	if(!def_zone || !limb_integrity) // the second check sees if we only cover one bodypart anyway and don't need to bother with this
		return
	var/list/covered_limbs = cover_flags2body_zones(body_parts_covered) // what do we actually cover?
	if(!(def_zone in covered_limbs))
		return

	var/damage_dealt = take_damage(damage_amount * 0.1, damage_type, "", FALSE, 1, 100) * 10 // only deal 10% of the damage to the general integrity damage, then multiply it by 10 so we know how much to deal to limb
	LAZYINITLIST(damage_by_parts)
	damage_by_parts[def_zone] += damage_dealt
	if(damage_by_parts[def_zone] > limb_integrity)
		disable_zone(def_zone, damage_type)
