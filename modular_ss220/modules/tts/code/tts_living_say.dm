/mob/living/Hear(message, atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, list/message_mods, message_range)
	. = ..()
	var/atom/movable/virtualspeaker/holopad_speaker = speaker
	var/atom/movable/real_speaker = istype(holopad_speaker) ? holopad_speaker.source : speaker

	var/effect = issilicon(real_speaker) ? SOUND_EFFECT_ROBOT : SOUND_EFFECT_NONE
	if(radio_freq)
		effect = issilicon(real_speaker) ? SOUND_EFFECT_RADIO_ROBOT : SOUND_EFFECT_RADIO
	else if(SPAN_COMMAND in spans)
		effect = issilicon(real_speaker) ? SOUND_EFFECT_MEGAPHONE_ROBOT : SOUND_EFFECT_MEGAPHONE
	var/traits = TTS_TRAIT_RATE_MEDIUM
	var/self_radio = radio_freq && src == real_speaker
	var/mob/living/carbon/human/human_speaker = real_speaker
	var/tts_seed = istype(human_speaker) ? human_speaker.tts_seed : "Arthas"
	if(!self_radio)
		INVOKE_ASYNC(GLOBAL_PROC, GLOBAL_PROC_REF(tts_cast), speaker, src, raw_message, tts_seed, TRUE, effect, traits)
