/datum/preference/text/tts_seed
	savefile_key = "tts_seed"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/text/tts_seed/create_default_value()
	return "Arthas"

/// Any humanoid (non-Xeno) mob, such as humans, plasmamen, lizards.
/mob/living/carbon/human
	var/tts_seed

/datum/preference/text/tts_seed/apply_to_human(mob/living/carbon/human/target, value)
	target.tts_seed = value
