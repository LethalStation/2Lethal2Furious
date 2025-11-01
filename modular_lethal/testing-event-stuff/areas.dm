/area/centcom/ctf/lizard_keep
	name = "Fortress Talunan"
	icon_state = "ctf_flag_a"

/area/centcom/ctf/lizard_flag
	name = "Fortress Talunan Flag Room"
	icon_state = "ctf_flag_a"

/area/centcom/ctf/tajaran_keep
	name = "Fortress Morikann"
	icon_state = "ctf_flag_a"

/area/centcom/ctf/tajaran_flag
	name = "Fortress Morikann Flag Room"
	icon_state = "ctf_flag_a"

/area/centcom/ctf/surroundings
	name = "Fortress Surroundings"
	icon_state = "ctf_flag_a"


/obj/structure/sign/flag/lizard
	name = "flag of Fortress Talunan"
	desc = "MY LIFE FOR THE BIG WOMEN WITH FAT TAILS!!"
	icon = 'modular_lethal/testing-event-stuff/flags.dmi'
	icon_state = "red"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/lizard, 32)

/obj/structure/sign/flag/tajaran
	name = "flag of Fortress Morikann"
	desc = "MY LIFE FOR THE BIG WOMEN WITH TWO TAILS!!"
	icon = 'modular_lethal/testing-event-stuff/flags.dmi'
	icon_state = "yellow"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/flag/tajaran, 32)

/datum/map_template/ctf/lethal
	name = "Medieval Clash"
	description = "Clan Talunan and House Morikann duke it out in a fierce brawl for the flags."
	mappath = "_maps/minigame/CTF/lethal.dmm"
