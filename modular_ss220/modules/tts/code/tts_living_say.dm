/mob/living/Hear(message, atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, list/message_mods, message_range)
	var/static/regex/plus_sign_replace = new(@"\+", "g")
	var/plussless_message = plus_sign_replace.Replace(raw_message, "")

	. = ..(message, speaker, message_language, plussless_message, radio_freq, spans, message_mods, message_range)

	if(!GET_CLIENT(src) || HAS_TRAIT(speaker, TRAIT_SIGN_LANG) || !message_language)
		return

	var/atom/movable/virtualspeaker/virtual_speaker = speaker
	var/atom/movable/real_speaker = istype(virtual_speaker) ? virtual_speaker.source : speaker

	var/self_radio = radio_freq && src == real_speaker
	if(self_radio)
		return

	var/effect = issilicon(real_speaker) ? SOUND_EFFECT_ROBOT : SOUND_EFFECT_NONE
	if(radio_freq)
		effect = issilicon(real_speaker) ? SOUND_EFFECT_RADIO_ROBOT : SOUND_EFFECT_RADIO
	else if(SPAN_COMMAND in spans)
		effect = issilicon(real_speaker) ? SOUND_EFFECT_MEGAPHONE_ROBOT : SOUND_EFFECT_MEGAPHONE

	var/traits = TTS_TRAIT_RATE_MEDIUM

	var/mob/living/carbon/human/human_speaker = real_speaker
	var/tts_seed = istype(human_speaker) ? human_speaker.tts_seed : "Arthas"

	var/message_tts = translate_language(language = message_language, raw_message = raw_message)

	INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(tts_cast), speaker, src, message_tts, tts_seed, !radio_freq, effect, traits)
