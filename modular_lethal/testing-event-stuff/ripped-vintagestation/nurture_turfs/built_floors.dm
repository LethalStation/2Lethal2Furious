/turf/open/rimworld_constructed
	name = "debug constructed floor"
	desc = "Wall? I hope there's no Marts around here to see this."
	icon = 'icons/vintagestation/floor/nurture/unsmooth.dmi'
	icon_state = "debug"
	layer = MID_TURF_LAYER - 0.03 // Under dirt and mud and whatnot. Update if anything lower than this exists
	baseturfs = /turf/baseturf_bottom
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	tiled_dirt = FALSE
	planetary_atmos = TRUE
	luminosity = 1
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

// Actual floors for real

/turf/open/rimworld_constructed/plank
	name = "wooden flooring"
	desc = "Planks and boards nailed to the ground. Keep away from fire."
	icon_state = "plank"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/rimworld_constructed/brick
	name = "stone brick flooring"
	desc = "Bricks layered one aside another to make a sturdy looking floor."
	icon_state = "brick"

/turf/open/rimworld_constructed/smooth
	name = "smoothed stone flooring"
	desc = "Natural stone that has been smoothed to look presentable."
	icon_state = "smooth"
