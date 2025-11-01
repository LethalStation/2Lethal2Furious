/datum/outfit/ctf/lethal_medieval
	name = "CTF Lethalstation (Nothing)"
	ears = /obj/item/radio/headset/headset_frontier_colonist
	uniform = null
	suit = null
	shoes = null
	gloves = null
	id = null
	belt = null
	l_pocket = /obj/item/flashlight/flare/torch/everburning
	r_pocket = null
	l_hand = null

/datum/outfit/ctf/lethal_medieval/lizard
	name = "CTF Tizirian (Choppa)"
	uniform = /obj/item/clothing/under/lizard_kilt/white
	suit = /obj/item/clothing/suit/armor/lizard/bronze
	head = /obj/item/clothing/head/helmet/lizard/white
	neck = /obj/item/clothing/neck/lizard_cape
	shoes = /obj/item/clothing/shoes/lizard_shins
	gloves = /obj/item/clothing/gloves/lizard_gloves
	belt = /obj/item/storage/belt/lizard_sabre/no_ap
	r_pocket = /obj/item/storage/pouch/medical/firstaid/lethal_loaded
	back = /obj/item/shield/buckler/reagent_weapon/lethal/big
	team_radio_freq = FREQ_CTF_RED

/datum/outfit/ctf/lethal_medieval/lizard_spear
	name = "CTF Tizirian (Spear)"
	uniform = /obj/item/clothing/under/lizard_kilt
	suit = /obj/item/clothing/suit/armor/lizard
	head = /obj/item/clothing/head/helmet/lizard
	neck = null
	shoes = /obj/item/clothing/shoes/lizard_shins
	gloves = /obj/item/clothing/gloves/lizard_gloves
	belt = null
	r_pocket = /obj/item/storage/pouch/medical/firstaid/lethal_loaded
	back = /obj/item/shield/buckler/reagent_weapon/lethal/big
	l_hand = /obj/item/forging/reagent_weapon/spear/lethal/lizard
	team_radio_freq = FREQ_CTF_RED

/datum/outfit/ctf/lethal_medieval/lizard_bow
	name = "CTF Tizirian (Bow)"
	uniform = /obj/item/clothing/under/lizard_kilt
	suit = /obj/item/clothing/suit/armor/lizard_bowman
	head = /obj/item/clothing/head/helmet/lizard
	neck = /obj/item/clothing/neck/lizard_cape/spec
	shoes = /obj/item/clothing/shoes/lizard_shins
	gloves = /obj/item/clothing/gloves/lizard_gloves
	belt = /obj/item/storage/bag/quiver/rimworld/full
	r_pocket = /obj/item/storage/pouch/medical/lethal_loaded
	back = /obj/item/gun/ballistic/bow/rimworld
	team_radio_freq = FREQ_CTF_RED

/datum/outfit/ctf/lethal_medieval/other_guys
	name = "CTF Vulpkanin (Axe)"
	uniform = /obj/item/clothing/under/vulp_pants
	suit = /obj/item/clothing/suit/armor/vulp
	head = /obj/item/clothing/head/helmet/vulp
	neck = /obj/item/clothing/neck/vulp_cloak
	shoes = /obj/item/clothing/shoes/vulp_shins
	gloves = /obj/item/clothing/gloves/vulp_gloves
	belt = /obj/item/forging/reagent_weapon/axe/lethal/tajaran
	r_pocket = /obj/item/storage/pouch/medical/firstaid/lethal_loaded
	back = /obj/item/shield/buckler/reagent_weapon/lethal
	team_radio_freq = FREQ_CTF_YELLOW

/datum/outfit/ctf/lethal_medieval/tajaran_spear
	name = "CTF Tajaran (Spear)"
	uniform = /obj/item/clothing/under/tajaran_corset
	suit = /obj/item/clothing/suit/armor/tajaran/gold
	head = /obj/item/clothing/head/helmet/tajaran/contract
	neck = /obj/item/clothing/neck/tajaran_cape
	shoes = /obj/item/clothing/shoes/tajaran_shins
	gloves = /obj/item/clothing/gloves/tajaran_gloves
	belt = null
	r_pocket = /obj/item/storage/pouch/medical/firstaid/lethal_loaded
	back = /obj/item/shield/buckler/reagent_weapon/lethal
	l_hand = /obj/item/forging/reagent_weapon/spear/lethal/tajaran
	team_radio_freq = FREQ_CTF_YELLOW

/datum/outfit/ctf/lethal_medieval/tajaran_bow
	name = "CTF Tajaran (Bow)"
	uniform = /obj/item/clothing/under/tajaran_corset
	suit = /obj/item/clothing/suit/armor/tajaran_bowman
	head = /obj/item/clothing/head/helmet/tajaran
	neck = null
	shoes = /obj/item/clothing/shoes/tajaran_shins
	gloves = /obj/item/clothing/gloves/tajaran_gloves
	belt = /obj/item/storage/bag/quiver/rimworld/full
	r_pocket = /obj/item/storage/pouch/medical/lethal_loaded
	back = /obj/item/gun/ballistic/bow/rimworld
	team_radio_freq = FREQ_CTF_YELLOW

/obj/machinery/ctf/spawner/yellow
	ctf_gear = list("Axeman" = /datum/outfit/ctf/lethal_medieval/other_guys, "Spearman" = /datum/outfit/ctf/lethal_medieval/tajaran_spear, "Bowman" = /datum/outfit/ctf/lethal_medieval/tajaran_bow)

/obj/machinery/ctf/spawner/red
	ctf_gear = list("Swordsman" = /datum/outfit/ctf/lethal_medieval/lizard, "Spearman" = /datum/outfit/ctf/lethal_medieval/lizard_spear, "Bowman" = /datum/outfit/ctf/lethal_medieval/lizard_bow)
