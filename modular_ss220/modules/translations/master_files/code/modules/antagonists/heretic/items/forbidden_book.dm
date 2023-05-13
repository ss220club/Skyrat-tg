/obj/item/codex_cicatrix
	desc = "This book describes the secrets of the veil between worlds."

/obj/item/codex_cicatrix/examine(mob/user)
	. = ..()
	if(!IS_HERETIC(user))
		return

	. -= span_notice("Can be used to tap influences for additional knowledge points.")
	. -= span_notice("Can also be used to draw or remove transmutation runes with ease.")
	. += span_notice("ПЕРЕВЕСТИ: Can be used to tap influences for additional knowledge points.")
	. += span_notice("ПЕРЕВЕСТИ: Can also be used to draw or remove transmutation runes with ease.")
