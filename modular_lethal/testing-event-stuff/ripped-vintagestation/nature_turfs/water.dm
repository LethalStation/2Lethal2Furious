/turf/open/water/rimworld
	name = "shallow water"
	desc = "A pool of water, is it a pond? Is it a river? I don't know, you're the one looking at it, you tell me."
	icon = 'icons/vintagestation/floor/nature/shallow_water.dmi'
	icon_state = "shallow_water-255"
	base_icon_state = "shallow_water"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_SHALLOW_WATER_HORIZON
	canSmoothWith = SMOOTH_GROUP_SHALLOW_WATER_HORIZON
	luminosity = 1
	baseturfs = /turf/open/water/rimworld
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	immerse_overlay_color = "#3c6677"

/turf/open/water/rimworld/deep
	name = "deep water"
	icon = 'icons/vintagestation/floor/nature/deep_water.dmi'
	icon_state = "deep_water-255"
	base_icon_state = "deep_water"
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_DEEP_WATER_HORIZON
	canSmoothWith = SMOOTH_GROUP_DEEP_WATER_HORIZON
	baseturfs = /turf/open/water/rimworld/deep
	immerse_overlay_color = "#314755"
	slowdown = 2
