/turf/closed/lethal_mineral
	name = "methane ice wall"
	desc = "A solid block of toxic methane brine, do your best not to lick this one."
	icon = 'icons/icon_cutter_deez/natural_walls/ice.dmi'
	icon_state = "ice-0"
	base_icon_state = "ice"
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ
	smoothing_groups = SMOOTH_GROUP_CLOSED_TURFS
	canSmoothWith = SMOOTH_GROUP_LETHAL_DOORS + SMOOTH_GROUP_GRILLE_WINDOWS + SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_WINDOW_FULLTILE
	baseturfs = /turf/open/misc/lethal_ice
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS

/turf/closed/lethal_mineral/rock
	name = "nuclear fulgurite wall"
	desc = "A solid block of nuclear glass, made by the bomb that turned this sector into a crater."
	icon = 'icons/icon_cutter_deez/natural_walls/rock.dmi'
	icon_state = "rock-0"
	base_icon_state = "rock"
	baseturfs = /turf/open/misc/lethal_fulgurite
