/datum/armor/armor_lethal_ranged
	melee = ARMOR_LEVEL_MID
	bullet = ARMOR_LEVEL_MID
	laser = ARMOR_LEVEL_WEAK
	energy = ARMOR_LEVEL_WEAK
	bomb = ARMOR_LEVEL_WEAK
	fire = ARMOR_LEVEL_MID
	acid = ARMOR_LEVEL_WEAK
	wound = WOUND_ARMOR_HIGH
	special_armor_value = SOFT_ARMOR_TYPE

/datum/armor/armor_lethal_melee
	melee = 75
	bullet = 75
	laser = ARMOR_LEVEL_MID
	energy = ARMOR_LEVEL_MID
	bomb = ARMOR_LEVEL_MID
	fire = ARMOR_LEVEL_MID
	acid = ARMOR_LEVEL_MID
	wound = WOUND_ARMOR_HIGH
	special_armor_value = HARD_ARMOR_TYPE

/obj/item/clothing/suit/armor/tajaran_bowman
	name = "house bowman armor"
	desc = "A light set of armor, made from the silk of a large spider-type creature captured or bought from \
		Vulpkanin homeworlds. Not nearly as good as hard steel, but much better than nothing"
	icon = 'modular_lethal/super_armor/icons/armor.dmi'
	icon_state = "soft_civilian"
	worn_icon = 'modular_lethal/super_armor/icons/armor_worn.dmi'
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/armor_lethal_ranged
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	max_integrity = 200
	limb_integrity = 300

/obj/item/clothing/suit/armor/lizard_bowman
	name = "clan bowman armor"
	desc = "A light set of armor made of woven fibers and thin metal scales to protect against getting shot \
		from off screen. You should really try just doding though."
	icon = 'modular_lethal/super_armor/icons/armor.dmi'
	icon_state = "korund"
	worn_icon = 'modular_lethal/super_armor/icons/armor_worn.dmi'
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	armor_type = /datum/armor/armor_lethal_ranged
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	max_integrity = 200
	limb_integrity = 300

/obj/item/clothing/shoes/lizard_shins
	max_integrity = 200
	limb_integrity = 300
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/gloves/lizard_gloves
	max_integrity = 200
	limb_integrity = 300
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/head/helmet/lizard
	max_integrity = 300
	limb_integrity = 400
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/suit/armor/lizard
	max_integrity = 300
	limb_integrity = 400
	armor_type = /datum/armor/armor_lethal_melee
	slowdown = 1

/obj/item/clohing/suit/armor/lizard/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_ARMOR_RUSTLE, 2)

/obj/item/clothing/suit/armor/lizard/bronze
	icon_state = "armor_bronze"

/obj/item/clothing/head/helmet/tajaran
	max_integrity = 300
	limb_integrity = 400
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/head/helmet/vulp
	max_integrity = 300
	limb_integrity = 400
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/head/helmet/vulp/white
	icon_state = "skirmisher_white"

/obj/item/clothing/suit/armor/tajaran
	max_integrity = 300
	limb_integrity = 400
	armor_type = /datum/armor/armor_lethal_melee
	slowdown = 1

/obj/item/clothing/suit/armor/tajaran/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_ARMOR_RUSTLE, 2)

/obj/item/clothing/suit/armor/vulp
	max_integrity = 300
	limb_integrity = 400
	armor_type = /datum/armor/armor_lethal_melee
	slowdown = 1

/obj/item/clothing/suit/armor/vulp/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/item_equipped_movement_rustle, SFX_PLATE_ARMOR_RUSTLE, 2)

/obj/item/clothing/shoes/tajaran_shins
	max_integrity = 200
	limb_integrity = 300
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/shoes/vulp_shins
	max_integrity = 200
	limb_integrity = 300
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/gloves/tajaran_gloves
	max_integrity = 200
	limb_integrity = 300
	armor_type = /datum/armor/armor_lethal_melee

/obj/item/clothing/gloves/vulp_gloves
	max_integrity = 200
	limb_integrity = 300
	armor_type = /datum/armor/armor_lethal_melee
