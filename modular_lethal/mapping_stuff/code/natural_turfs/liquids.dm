/turf/open/water/lethal_ammonia
	name = "liquid ammonia"
	desc = "A pool of high concentration ammonia, its probably best if you keep this away from your skin."
	icon = 'icons/icon_cutter_deez/natural_floors/ammonia.dmi'
	icon_state = "ammonia-255"
	base_icon_state = "ammonia"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_LIQ_AMMONIA
	canSmoothWith = SMOOTH_GROUP_LIQ_AMMONIA
	baseturfs = /turf/open/water/lethal_ammonia
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	immerse_overlay_color = "#332e3b"

/turf/open/water/lethal_ammonia/deep
	name = "deep liquid ammonia"
	icon = 'icons/icon_cutter_deez/natural_floors/ammonia_deep.dmi'
	icon_state = "ammonia_deep-255"
	base_icon_state = "ammonia_deep"
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_DEEP_AMMONIA
	canSmoothWith = SMOOTH_GROUP_DEEP_AMMONIA
	baseturfs = /turf/open/water/lethal_ammonia/deep
	immerse_overlay_color = "#222222"
	slowdown = 2

/turf/open/water/lethal_methane
	name = "methane brine"
	desc = "A pool of toxic brine, composed mostly of methane, ammonia, and copper salts."
	icon = 'icons/icon_cutter_deez/natural_floors/brine.dmi'
	icon_state = "ammonia-255"
	base_icon_state = "ammonia"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_LIQ_METH
	canSmoothWith = SMOOTH_GROUP_LIQ_METH
	baseturfs = /turf/open/water/lethal_methane
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	immerse_overlay_color = "#629b7f"

/turf/open/water/lethal_methane/deep
	name = "deep methane brine"
	icon = 'icons/icon_cutter_deez/natural_floors/brine_deep.dmi'
	icon_state = "ammonia_deep-255"
	base_icon_state = "ammonia_deep"
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_DEEP_METH
	canSmoothWith = SMOOTH_GROUP_DEEP_METH
	baseturfs = /turf/open/water/lethal_methane/deep
	immerse_overlay_color = "#3a483d"
	slowdown = 2

/turf/open/water/lethal_ketone
	name = "superketone pool"
	desc = "A pool of ominously yellow superconducting ketones, a special solution used to spread heat from generators to the rest \
		of the sector before they were damaged beyond use, creating pools like this one."
	icon = 'icons/icon_cutter_deez/natural_floors/ammonia.dmi'
	icon_state = "ammonia-255"
	base_icon_state = "ammonia"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_LIQ_KETONE
	canSmoothWith = SMOOTH_GROUP_LIQ_KETONE
	baseturfs = /turf/open/water/lethal_ketone
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	immerse_overlay_color = "#9d7f4b"
	light_range = 2
	light_power = 0.30
	light_color = "#d2c545"
	light_on = TRUE

/turf/open/water/lethal_ketone/deep
	name = "deep superketone pool"
	icon = 'icons/icon_cutter_deez/natural_floors/ammonia_deep.dmi'
	icon_state = "ammonia_deep-255"
	base_icon_state = "ammonia_deep"
	smoothing_groups = SMOOTH_GROUP_TURF_OPEN + SMOOTH_GROUP_DEEP_KETONE
	canSmoothWith = SMOOTH_GROUP_DEEP_KETONE
	baseturfs = /turf/open/water/lethal_ketone/deep
	immerse_overlay_color = "#51352d"
	slowdown = 2
