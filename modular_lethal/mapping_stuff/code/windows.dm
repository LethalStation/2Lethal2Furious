/obj/structure/window/fulltile
	icon = 'icons/icon_cutter_deez/windows/window.dmi'
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ
	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_CLOSED_TURFS

/obj/structure/window/reinforced/fulltile
	icon = 'icons/icon_cutter_deez/windows/reinforced_window.dmi'
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ
	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_CLOSED_TURFS

/obj/structure/window/plasma/fulltile
	icon = 'icons/icon_cutter_deez/windows/plasma_window.dmi'
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ
	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_CLOSED_TURFS

/obj/structure/window/reinforced/plasma/fulltile
	icon = 'icons/icon_cutter_deez/windows/rplasma_window.dmi'
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ
	canSmoothWith = SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_CLOSED_TURFS

/obj/structure/grille/window
	name = "window grille"
	desc = "A simple, fragile grille that protects windows."
	icon = 'icons/icon_cutter_deez/windows/grille_window.dmi'
	icon_state = "grille_window-0"
	base_icon_state = "grille_window"
	plane = GAME_PLANE
	layer = ABOVE_OBJ_LAYER + 0.01
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ
	smoothing_groups = SMOOTH_GROUP_GRILLE_WINDOWS
	canSmoothWith = SMOOTH_GROUP_GRILLE_WINDOWS + SMOOTH_GROUP_CLOSED_TURFS
	looks_when_damaged = FALSE

/obj/structure/grille
	/// Do we have different icon states for being damaged?
	var/looks_when_damaged = TRUE

/// WAR ULTRAKILL

/obj/structure/window
	alpha = 200

/obj/structure/window/plasma
	icon = 'icons/obj/structures.dmi'

/obj/structure/window/reinforced
	icon = 'icons/obj/structures.dmi'
