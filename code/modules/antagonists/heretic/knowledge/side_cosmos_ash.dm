// Sidepaths for knowledge between Cosmos and Ash.

/datum/heretic_knowledge/summon/fire_shark
	name = "Scorching Shark"
	desc = "Позволяет трансмутировать пул пепла, печень и лист плазмы в Огненную акулу. \
		Огненные акулы быстры и сильны в группах, но быстро погибают. Они также очень устойчивы к огненным атакам. \
		Огненные акулы впрыскивают флогистон в своих жертв и порождают плазму после их смерти."
	gain_text = "Мои знания о вселенной с энергией останков, построили ее. Они дали жизнь Огненной акуле."
	next_knowledge = list(
		/datum/heretic_knowledge/spell/cosmic_runes,
		/datum/heretic_knowledge/spell/ash_passage,
	)
	required_atoms = list(
		/obj/effect/decal/cleanable/ash = 1,
		/obj/item/organ/internal/liver = 1,
		/obj/item/stack/sheet/mineral/plasma = 1,
	)
	mob_to_summon = /mob/living/basic/fire_shark
	cost = 1
	route = PATH_SIDE

/datum/heretic_knowledge/spell/space_phase
	name = "Space Phase"
	desc = "Дарует вам Space Phase - заклинание, позволяющее свободно перемещаться в космосе. \
		Появляться и исчезать можно только тогда, когда вы находитесь в на космических или схожих тайлах."
	gain_text = "Вы чувствуете, что ваше тело может перемещаться по космосу, как будто вы пылинка."
	next_knowledge = list(
		/datum/heretic_knowledge/spell/star_blast,
		/datum/heretic_knowledge/mad_mask,
	)
	spell_to_add = /datum/action/cooldown/spell/jaunt/space_crawl
	cost = 1
	route = PATH_SIDE

/datum/heretic_knowledge/eldritch_coin
	name = "Eldritch Coin"
	desc = "Позволяет трансмутировать лист плазмы и алмаз, чтобы создать Элдритовую монету. \
		Монета будет открывать или закрывать близлежащие двери, если приземлится на орла, и болтировать или отболтировать их, \
		если приземлится на решку. Если монета попадает в шлюз, она емагнет дверь, уничтожая монету."
	gain_text = "Он бросил монету и выиграл свою ставку, теперь он получает..."
	next_knowledge = list(
		/datum/heretic_knowledge/spell/cosmic_expansion,
		/datum/heretic_knowledge/spell/flame_birth,
	)
	required_atoms = list(
		/obj/item/stack/sheet/mineral/diamond = 1,
		/obj/item/stack/sheet/mineral/plasma = 1,
	)
	result_atoms = list(/obj/item/coin/eldritch)
	cost = 1
	route = PATH_SIDE
