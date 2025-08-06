/// Refers to CHARACTER-SPECIFIC information that should be retained between rounds.
/// This is a bit of a stupid thing to do because preferences are already "persistent but it's essentially just a wrapper to
/// easily piggy-back off the json savefile stuff that preferences already handles without needing to do it *again*.
/datum/preference/persistent
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_identifier = PREFERENCE_CHARACTER
	can_randomize = FALSE

/datum/preference/persistent/apply_to_human(mob/living/carbon/human/target, value)
	return FALSE

/datum/preference/persistent/create_default_value()
	return 0

/datum/preference/persistent/deserialize(input, datum/preferences/preferences)
	return input

/datum/preference/persistent/serialize(input)
	return input

/datum/preference/persistent/is_valid(value)
	return TRUE


// Actual preferences below

/// Have we had an apartment template spawned for us at a previous point, and available on disk?
/// If so, set this to the expected filepath of the .dmm template INSIDE THEIR PREFERENCES DIR.
/// THIS INCLUDES THEIR CKEY AND ALSO THE CHARACTER-SPECIFIC PREFS INDEX!!! YOU NEED TO SET THIS WHEN YOU WRITE IT!!

/datum/preference/persistent/apartment_dmm
	savefile_key = "apartment_dmm"
