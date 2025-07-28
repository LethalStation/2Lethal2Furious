/obj/structure/wall_cladding
	name = "wall cladding"
	desc = "Sheets of metal-polymer alloys that protect the bare metal of the walls behind them from everyday activities."
	icon = 'modular_lethal/mapping_stuff/icons/cladding.dmi'
	icon_state = "basic_big"
	SET_BASE_PIXEL(0, 22)
	layer = TABLE_LAYER
	anchored = TRUE
	density = FALSE
	max_integrity = 200
	dir = NORTH

/obj/structure/wall_cladding/Initialize(mapload)
	. = ..()
	find_and_hang_on_wall()

/obj/structure/wall_cladding/basic
	icon_state = "basic_big"

/obj/structure/wall_cladding/tiled
	icon_state = "basic_tiled"

/obj/structure/wall_cladding/service_panel
	icon_state = "basic_service"
