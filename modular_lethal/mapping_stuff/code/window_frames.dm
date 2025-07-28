/datum/armor/window_frame
	melee = 50
	bullet = 70
	laser = 70
	energy = 100
	bomb = 10
	bio = 100
	fire = 0
	acid = 0

/datum/armor/window_frame_reinforced
	melee = 80
	bomb = 25
	bio = 100
	fire = 80
	acid = 100

/obj/structure/window_frame
	name = "window frame"
	desc = "A frame section to place a window on top."
	icon = 'icons/icon_cutter_deez/low_walls/low_wall.dmi'
	icon_state = "low_wall-0"
	base_icon_state = "low_wall"
	smoothing_flags = SMOOTH_BITMASK|SMOOTH_OBJ
	smoothing_groups = SMOOTH_GROUP_WINDOW_FRAMES
	canSmoothWith = SMOOTH_GROUP_WINDOW_FRAMES
	pass_flags_self = PASSTABLE | LETPASSTHROW | PASSGRILLE | PASSWINDOW
	opacity = FALSE
	density = TRUE
	rad_insulation = null
	armor_type = /datum/armor/window_frame
	max_integrity = 50
	anchored = TRUE
	/// If we spawn a window on top of this when created
	var/start_with_window = FALSE
	/// The frame overlay applied to this to hide wires under the edges but still show them underneath
	var/frame_icon = 'icons/icon_cutter_deez/low_wall_frame/low_wall.dmi'
	/// Typepath. Creates a corresponding window for this frame.
	/// Is either a material sheet typepath (eg /obj/item/stack/sheet/glass) or a fulltile window typepath (eg /obj/structure/window/fulltile)
	var/window_type = /obj/structure/window/fulltile

/obj/structure/window_frame/Initialize(mapload)
	. = ..()
	update_appearance()
	AddElement(/datum/element/climbable)
	AddElement(/datum/element/elevation, pixel_shift = 12)
	if(start_with_window)
		create_structure_window(window_type)

/// Do we have a window ??
/obj/structure/window_frame/proc/has_window()
	SHOULD_BE_PURE(TRUE)
	for(var/obj/structure/window/window in loc)
		if(window.fulltile)
			return TRUE
	return FALSE

/obj/structure/window_frame/attack_animal(mob/user, list/modifiers)
	. = ..()
	if(!.)
		return
	if(!QDELETED(src)) //Last hit still shocks but shouldn't deal damage to the grille
		take_damage(rand(5,10), BRUTE, MELEE, 1)

/obj/structure/window_frame/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	user.do_attack_animation(src, ATTACK_EFFECT_KICK)
	user.visible_message(span_warning("[user] hits [src]."), null, null, COMBAT_MESSAGE_RANGE)
	log_combat(user, src, "hit")
	take_damage(rand(5,10), BRUTE, MELEE, 1)

/obj/structure/window_frame/attack_alien(mob/living/user, list/modifiers)
	user.do_attack_animation(src)
	user.changeNext_move(CLICK_CD_MELEE)
	user.visible_message(span_warning("[user] mangles [src]."), null, null, COMBAT_MESSAGE_RANGE)
	take_damage(20, BRUTE, MELEE, 1)

/obj/structure/window_frame/welder_act_secondary(mob/living/user, obj/item/tool)
	. = ..()
	add_fingerprint(user)
	if(!tool.tool_start_check(user, amount = 0))
		return ITEM_INTERACT_BLOCKING
	balloon_alert(user, "cutting...")
	if(!tool.use_tool(src, user, 70, volume = 50))
		return ITEM_INTERACT_BLOCKING
	balloon_alert(user, "deconstructed")
	deconstruct(TRUE)
	return ITEM_INTERACT_SUCCESS

/obj/structure/window_frame/welder_act(mob/living/user, obj/item/tool)
	. = ..()
	add_fingerprint(user)
	if(atom_integrity >= max_integrity)
		to_chat(user, span_warning("[src] is already in good condition!"))
		return ITEM_INTERACT_BLOCKING
	if(!tool.tool_start_check(user, amount = 0))
		return ITEM_INTERACT_BLOCKING
	balloon_alert(user, "repairing...")
	if(!tool.use_tool(src, user, 40, volume = 50))
		return ITEM_INTERACT_BLOCKING
	atom_integrity = max_integrity
	balloon_alert(user, "repaired!")
	update_appearance()
	return ITEM_INTERACT_SUCCESS

/// Creates a window from the typepath given from window_type, which is either a glass sheet typepath or a /obj/structure/window subtype
/obj/structure/window_frame/proc/create_structure_window(window_material_type)
	var/obj/structure/window/our_window
	if(ispath(window_material_type, /obj/structure))
		our_window = new window_material_type(loc)
	// window_material_type isnt a window typepath, so check if its a material typepath
	if(ispath(window_material_type, /obj/item/stack/sheet/glass))
		our_window = new /obj/structure/window/fulltile(loc)
	if(ispath(window_material_type, /obj/item/stack/sheet/rglass))
		our_window = new /obj/structure/window/reinforced/fulltile(loc)
	if(ispath(window_material_type, /obj/item/stack/sheet/plasmaglass))
		our_window = new /obj/structure/window/plasma/fulltile(loc)
	if(ispath(window_material_type, /obj/item/stack/sheet/plasmarglass))
		our_window = new /obj/structure/window/reinforced/plasma/fulltile(loc)
	if(ispath(window_material_type, /obj/item/stack/sheet/plasmarglass))
		our_window = new /obj/structure/grille/window(loc)
	our_window.update_appearance()
	return our_window

/obj/structure/window_frame/attackby(obj/item/attacking_item, mob/living/user, params)
	add_fingerprint(user)
	if(isstack(attacking_item))
		var/obj/item/stack/adding_stack = attacking_item
		var/stack_name = "[adding_stack]" // in case the stack gets deleted after use()
		if(is_glass_sheet(adding_stack) && !(has_window()) && adding_stack.use(2))
			to_chat(user, "<span class='notice'>You start to add [stack_name] to [src].")
			if(!do_after(user, 2 SECONDS, src))
				return
			to_chat(user, "<span class='notice'>You add [stack_name] to [src].")
			var/obj/structure/window/our_window = create_structure_window(adding_stack.type)
			our_window.state = WINDOW_OUT_OF_FRAME
			our_window.set_anchored(FALSE)
	return ..()

/obj/structure/window_frame/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = NONE)
	switch(damage_type)
		if(BRUTE)
			if(damage_amount)
				playsound(src, 'sound/effects/grillehit.ogg', 80, TRUE)
			else
				playsound(src, 'sound/items/weapons/tap.ogg', 50, TRUE)
		if(BURN)
			playsound(src, 'sound/items/tools/welder.ogg', 80, TRUE)

/obj/structure/window_frame/attack_paw(mob/user, list/modifiers)
	return attack_hand(user, modifiers)

/obj/structure/window_frame/examine(mob/user)
	. = ..()
	if(has_window())
		. += "<span class='notice'>The window is fully constructed.</span>"
	else
		. += "<span class='notice'>The window frame is empty</span>"

/// Delightfully devilous seymour - I made it, despite your directions ~Paxilmaniac
/obj/structure/window_frame/set_smoothed_icon_state(new_junction)
	. = ..()
	update_icon()

/// If this frame has a valid frame icon, creates it. this is what obscures the cable if it goes through the frame
/obj/structure/window_frame/proc/create_frame_overlay(list/return_list)
	if(!frame_icon || !return_list)
		return
	return_list += mutable_appearance(frame_icon, "[base_icon_state]-[smoothing_junction]", appearance_flags = KEEP_APART)

/obj/structure/window_frame/update_overlays()
	. = ..()
	create_frame_overlay(.)

/obj/structure/window_frame/has_window
	start_with_window = TRUE

/obj/structure/window_frame/has_window/reinforced
	start_with_window = TRUE
	window_type = /obj/structure/window/reinforced/fulltile

/obj/structure/window_frame/has_window/grille_window
	window_type = /obj/structure/grille/window
	start_with_window = TRUE

/obj/structure/window_frame/reinforced
	name = "reinforced window frame"
	window_type = /obj/structure/window/reinforced/fulltile
	armor_type = /datum/armor/window_frame_reinforced
	max_integrity = 150
	damage_deflection = 11

/obj/structure/window_frame/reinforced/has_window
	start_with_window = TRUE

/obj/structure/window_frame/reinforced/has_window/plasma
	window_type = /obj/structure/window/plasma/fulltile
	start_with_window = TRUE

/obj/structure/window_frame/reinforced/has_window/super_plasma
	window_type = /obj/structure/window/reinforced/plasma/fulltile
	start_with_window = TRUE
