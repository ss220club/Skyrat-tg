/datum/armament_entry/assault_operatives/implants
	category = "Кибернетические импланты"
	subcategory = "Без категории"
	category_item_limit = 3

/datum/armament_entry/assault_operatives/implants/deathrattle
	name = "Deathrattle Implant Kit"
	description = "Набор из имплантов (и одного многоразового), которые должны быть имплантированы в команду. Когда один из оперативников \
	умирает, все другие носители импланта получают ментальное сообщение об его имени и местоположении. \
	В отличие от других имплантов, эти можно имплантировать в любое существо - будь то биологическое или механическое."
	item_type = /obj/item/storage/box/syndie_kit/imp_deathrattle
	cost = 1

/datum/armament_entry/assault_operatives/implants/microbomb
	name = "Microbomb Implant"
	description = "Маленькая бомба, имплантированная в тело. Она может быть активирована вручную или автоматически при смерти. ВНИМАНИЕ: Полностью уничтожает ваше тело и всё, что вы носили."
	item_type = /obj/item/implanter/explosive
	cost = 2

/datum/armament_entry/assault_operatives/implants/storage
	name = "Storage Implant"
	description = "Скрытный имплант ручной активации, позволяющий открыть маленький блуспейс карман, способный поместить в себя два предмета обычного размера."
	item_type = /obj/item/implanter/storage
	cost = 2

/datum/armament_entry/assault_operatives/implants/radio
	name = "Radio Implant"
	description = "Скрытный имплант ручной активации, позволяющий говорить по рации без необходимости наушника."
	item_type = /obj/item/implanter/radio/syndicate
	cost = 1

/datum/armament_entry/assault_operatives/implants/hacking
	item_type = /obj/item/autosurgeon/syndicate/hackerman
	name = "Hacking Arm Implant"
	description = "Продвинутый имплант для руки, содержащий передовые инструменты для взлома. Идеален для кибернетически усовершенствованных взломщиков."
	cost = 2

/datum/armament_entry/assault_operatives/implants/freedom
	name = "Freedom Implant"
	description = "Освобождает пользователя от наручников и бол. Изначально имеет четыре заряда."
	item_type = /obj/item/storage/box/syndie_kit/imp_freedom
	cost = 3

/datum/armament_entry/assault_operatives/implants/thermal
	name = "Thermal Vision Implant"
	description = "Кибернетические глаза с прибором термального зрения."
	item_type = /obj/item/autosurgeon/syndicate/thermal_eyes
	cost = 5

/datum/armament_entry/assault_operatives/implants/nodrop
	name = "Anti-Drop Implant"
	description = "При активации заставляет мышцы рук крепко сжимать предмет, которая она держит, предотвращая его непроизвольное падение."
	item_type = /obj/item/autosurgeon/syndicate/nodrop
	cost = 5
