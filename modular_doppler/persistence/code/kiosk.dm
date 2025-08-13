/obj/item/apartment_kiosk
	name = "apartment kiosk"
	desc = "Half-decade old self-checkin technology preserved by the frigid cold of Pluto's subsurface. Use this to enter or acquire your very own place of residence."
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "computer_broken"
	anchored = TRUE
	interaction_flags_item = NONE

/obj/item/apartment_kiosk/attack_hand(mob/user, list/modifiers)
	if (!GLOB.persistent_apartments[user.client])
		// no apartment detected loaded, so spawn us in a new one!
		var/datum/persistent_apartment/our_pad = new(user.client)
		//debug actions
		var/datum/action/apartment_kiosk_save/testbut = new
		testbut.Grant(user)
		var/datum/action/apartment_kiosk_unload/testbut2 = new
		testbut2.Grant(user)
		//debug actions end
		if (our_pad.loaded)
			if (our_pad.entry_turf)
				user.forceMove(our_pad.entry_turf)
			else
				src.say("Apartment loaded, but you still haven't added atmos into area, idiot.")

/datum/action/apartment_kiosk_save
	name = "Save Persistent Apartment"
	desc = "yooriss lazy debugging ayayayaya"
	button_icon_state = "cancel_peephole"

/datum/action/apartment_kiosk_save/Trigger(trigger_flags)
	. = ..()
	message_admins("attempting to save persistent apartment oh shit oh fuck...")
	var/owner_ckey = owner.client.ckey
	var/pref_slot = owner.client.prefs?.default_slot
	var/datum/persistent_apartment/our_pad = GLOB.persistent_apartments["[owner_ckey]:[pref_slot]"]
	if (our_pad)
		// good luck soldier
		our_pad.Save()
		message_admins("...did that work?")

/datum/action/apartment_kiosk_unload
	name = "Unload Persistent Apartment"
	desc = "Don't stand in the thing while you're doing this, dumbass."
	button_icon_state = "cancel_peephole"

/datum/action/apartment_kiosk_unload/Trigger(trigger_flags)
	. = ..()
	message_admins("unloading persistent apartment...")
	var/owner_ckey = owner.client.ckey
	var/pref_slot = owner.client.prefs?.default_slot
	var/datum/persistent_apartment/our_pad = GLOB.persistent_apartments["[owner_ckey]:[pref_slot]"]
	if (our_pad)
		qdel(our_pad) // good night sweet prince
		qdel(src)
