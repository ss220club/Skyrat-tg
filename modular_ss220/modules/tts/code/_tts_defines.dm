#define SOUND_EFFECT_NONE 0
#define SOUND_EFFECT_RADIO 1
#define SOUND_EFFECT_ROBOT 2
#define SOUND_EFFECT_RADIO_ROBOT 3
#define SOUND_EFFECT_MEGAPHONE 4
#define SOUND_EFFECT_MEGAPHONE_ROBOT 5

#define CHANNEL_TTS_RADIO 1008

#define TTS_TRAIT_PITCH_WHISPER (1<<1)
#define TTS_TRAIT_RATE_FASTER (1<<2)
#define TTS_TRAIT_RATE_MEDIUM (1<<3)

#define rustg_file_write_b64decode(text, fname) RUSTG_CALL(RUST_G, "file_write")(text, fname, "true")

// Hashing Operations //
#define rustg_hash_string(algorithm, text) RUSTG_CALL(RUST_G, "hash_string")(algorithm, text)
#define rustg_hash_file(algorithm, fname) RUSTG_CALL(RUST_G, "hash_file")(algorithm, fname)

#define RUSTG_HASH_MD5 "md5"

#ifdef RUSTG_OVERRIDE_BUILTINS
	#define md5(thing) (isfile(thing) ? rustg_hash_file(RUSTG_HASH_MD5, "[thing]") : rustg_hash_string(RUSTG_HASH_MD5, thing))
#endif

// Text Operations //
#define rustg_cyrillic_to_latin(text) RUSTG_CALL(RUST_G, "cyrillic_to_latin")("[text]")
#define rustg_latin_to_cyrillic(text) RUSTG_CALL(RUST_G, "latin_to_cyrillic")("[text]")

#define TTS_CATEGORY_OTHER "Другое"
#define TTS_CATEGORY_WARCRAFT3 "WarCraft 3"
#define TTS_CATEGORY_HALFLIFE2 "Half-Life 2"
#define TTS_CATEGORY_STARCRAFT "StarCraft"
#define TTS_CATEGORY_PORTAL2 "Portal 2"
#define TTS_CATEGORY_STALKER "STALKER"
#define TTS_CATEGORY_DOTA2 "Dota 2"
#define TTS_CATEGORY_LOL "League of Legends"
#define TTS_CATEGORY_FALLOUT "Fallout"
#define TTS_CATEGORY_FALLOUT2 "Fallout 2"
#define TTS_CATEGORY_POSTAL2 "Postal 2"
#define TTS_CATEGORY_TEAMFORTRESS2 "Team Fortress 2"
#define TTS_CATEGORY_ATOMIC_HEART "Atomic Heart"
#define TTS_CATEGORY_OVERWATCH "Overwatch"
#define TTS_CATEGORY_SKYRIM "Skyrim"
#define TTS_CATEGORY_RITA "Rita"
#define TTS_CATEGORY_METRO "Metro"
#define TTS_CATEGORY_HEROESOFTHESTORM "Heroes of the Storm"
#define TTS_CATEGORY_HEARTHSTONE "Hearthstone"
#define TTS_CATEGORY_VALORANT "Valorant"
#define TTS_CATEGORY_EVILISLANDS "Evil Islands"

#define TTS_GENDER_ANY "Любой"
#define TTS_GENDER_MALE "Мужской"
#define TTS_GENDER_FEMALE "Женский"

#define TTS_PHRASES list(\
		"Так звучит мой голос.",\
		"Так я звучу.",\
		"Я.",\
		"Поставьте свою подпись.",\
		"Пора за работу.",\
		"Дело сделано.",\
		"Станция Нанотрейзен.",\
		"Офицер СБ.",\
		"Капитан.",\
		"Вульпканин.",\
		"Съешь же ещё этих мягких французских булок, да выпей чаю.",\
		"Клоун, прекрати разбрасывать банановые кожурки офицерам под ноги!",\
		"Капитан, вы уверены что хотите назначить клоуна на должность главы персонала?",\
	)

/proc/error(msg)
	log_world("## ERROR: [msg]")
