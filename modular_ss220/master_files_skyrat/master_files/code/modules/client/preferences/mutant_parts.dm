//Disables taur
/datum/preference/toggle/mutant_toggle/taur/is_accessible(datum/preferences/preferences)
	. = ..()
	return FALSE

/datum/preference/choiced/mutant_choice/taur/is_accessible(datum/preferences/preferences)
	. = ..()
	return FALSE

/datum/preference/tri_color/taur/is_accessible(datum/preferences/preferences)
	. = ..()
	return FALSE

/datum/preference/tri_bool/taur/is_accessible(datum/preferences/preferences)
	. = ..()
	return FALSE
