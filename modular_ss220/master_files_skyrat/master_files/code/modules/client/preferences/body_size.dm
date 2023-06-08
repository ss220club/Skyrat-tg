//Disables body size changes in character preferences
/datum/preference/numeric/body_size/is_accessible(datum/preferences/preferences)
	. = ..()
	return FALSE
