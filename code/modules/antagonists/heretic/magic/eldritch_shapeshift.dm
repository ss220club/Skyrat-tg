// Given to heretic monsters.
/datum/action/cooldown/spell/shapeshift/eldritch
	name = "Shapechange"
	desc = "Заклинание, позволяющее вам принять облик другого существа, получив его способности. \
		После того как вы сделаете свой выбор, вы не сможете поменять его."
	background_icon_state = "bg_heretic"
	overlay_icon_state = "bg_heretic_border"

	school = SCHOOL_FORBIDDEN
	invocation = "SH'PE"
	invocation_type = INVOCATION_WHISPER
	spell_requirements = NONE

	possible_shapes = list(
		/mob/living/basic/mouse,
		/mob/living/basic/pet/dog/corgi,
		/mob/living/basic/carp,
		/mob/living/simple_animal/bot/secbot,
		/mob/living/simple_animal/pet/fox,
		/mob/living/simple_animal/pet/cat,
	)
