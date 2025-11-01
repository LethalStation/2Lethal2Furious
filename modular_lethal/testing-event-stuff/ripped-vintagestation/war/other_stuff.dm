// Lamps
/obj/item/flashlight/rimworld_lamp
	name = "oil lamp"
	desc = "A small bowl filled with oil from animal fat, makes an effective and long lasting lamp."
	icon = 'modular_lethal/testing-event-stuff/ripped-vintagestation/war/icons/objects.dmi'
	icon_state = "lamp"
	inhand_icon_state = null
	light_range = 3
	light_power = 0.8
	light_color = "#ffcc66"
	light_system = OVERLAY_LIGHT

/obj/item/flashlight/rimworld_lamp/on
	start_on = TRUE
	anchored = TRUE

// Soap
/obj/item/soap/rimworld
	name = "bar of soap"
	desc = "A bar of soap made from oils and certain plants."
	icon = 'modular_sloppler/war/icons/objects.dmi'
	icon_state = "soap"
	inhand_icon_state = null
	worn_icon_state = null
	cleanspeed = 3 SECONDS
