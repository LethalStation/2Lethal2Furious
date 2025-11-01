/obj/structure/rimworld_fence
	name = "evil debug fence"
	desc = "This could probably be good for keeping animals in, IF IT WORKED!!"
	anchored = TRUE
	density = TRUE
	max_integrity = 100
	pass_flags_self = PASSTABLE | LETPASSTHROW
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ

/obj/structure/rimworld_fence/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/climbable)
	AddElement(/datum/element/elevation, pixel_shift = 12)

/obj/structure/rimworld_fence/wood
	name = "wood fence"
	desc = "Posts driven into the ground to keep the animals out, or in."
	icon = 'icons/vintagestation/fence/wood_fence.dmi'
	icon_state = "wood_fence-0"
	base_icon_state = "wood_fence"
	resistance_flags = FLAMMABLE
	smoothing_groups = SMOOTH_GROUP_RIMWORLD_WOOD_FENCE
	canSmoothWith = SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_RIMWORLD_DOORS + SMOOTH_GROUP_RIMWORLD_WOOD_FENCE

/obj/structure/rimworld_fence/stone
	name = "stone fence"
	desc = "Bricks stacked up to make a neat short wall."
	icon = 'icons/vintagestation/fence/stone_fence.dmi'
	icon_state = "stone_fence-0"
	base_icon_state = "stone_fence"
	max_integrity = 150
	smoothing_groups = SMOOTH_GROUP_RIMWORLD_STONE_FENCE
	canSmoothWith = SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_RIMWORLD_DOORS + SMOOTH_GROUP_RIMWORLD_STONE_FENCE
