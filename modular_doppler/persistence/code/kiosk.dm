/obj/item/apartment_kiosk
	name = "apartment kiosk"
	desc = "Half-decade old self-checkin technology preserved by the frigid cold of Pluto's subsurface. Use this to enter or acquire your very own place of residence."
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "computer_broken"
	anchored = TRUE
	interaction_flags_item = NONE

/obj/item/apartment_kiosk/attack_hand(mob/user, list/modifiers)
	// ok so the gist of what we're doing here is:
	// we will store the knowledge that we have an apartment as a CHARACTER PREFERENCE. (specifically, as a filepath to their apartment .dmm template that we export)
	// if that preference exists, we will attempt to recreate their stored apartment export from the template we saved to file.
	// if the preference doesn't exist, we will create them a new one from a base template, then immediately save that to file.
	// at the end of the round, we will ensure all spawned apartments are written to file with their current contents
	// we'll also do all this inside /datum/persistent_apartment so we can just...alist
	if (!GLOB.persistent_apartments[user.client])
		// no apartment detected loaded, so spawn us in a new one!
		var/datum/persistent_apartment/our_pad = new(user.client)
		var/datum/action/apartment_kiosk_save/testbut = new
		testbut.Grant(user)

		if (our_pad.loaded)
			user.forceMove(our_pad.entry_turf)

/datum/action/apartment_kiosk_save
	name = "Save Persistent Apartment"
	desc = "yooriss lazy debugging ayayayaya"
	button_icon_state = "cancel_peephole"

/datum/action/apartment_kiosk_save/Trigger(trigger_flags)
	. = ..()
	message_admins("attempting to save persistent apartment oh shit oh fuck...")
	var/datum/persistent_apartment/our_pad = GLOB.persistent_apartments[owner.client]
	if (our_pad)
		// good luck soldier
		our_pad.Save()
		message_admins("...did that work?")
