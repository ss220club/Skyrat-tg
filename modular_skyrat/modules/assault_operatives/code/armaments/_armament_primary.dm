#define OPS_SUBCATEGORY_RIFLE "Штурмовые винтовки"
#define OPS_SUBCATEGORY_RIFLE_AMMO "Специальные патроны для штурмовой винтовки"

#define OPS_SUBCATEGORY_SMG "Пистолет-пулемёты"
#define OPS_SUBCATEGORY_SMG_AMMO "Специальные патроны для пистолет-пулемётов"

#define OPS_SUBCATEGORY_SHOTGUN "Дробовики"
#define OPS_SUBCATEGORY_SHOTGUN_AMMO "Специальные патроны для дробовиков"

#define OPS_SUBCATEGORY_SNIPER "Снайперские винтовки"
#define OPS_SUBCATEGORY_SNIPER_AMMO "Специальные патроны для снайперских винтовок"

/datum/armament_entry/assault_operatives/primary
	category = "Основное оружие"
	category_item_limit = 6
	mags_to_spawn = 3
	cost = 10

/datum/armament_entry/assault_operatives/primary/rifle
	subcategory = OPS_SUBCATEGORY_RIFLE

/datum/armament_entry/assault_operatives/primary/rifle/assault_ops_rifle
	item_type = /obj/item/gun/ballistic/automatic/assault_ops_rifle

/datum/armament_entry/assault_operatives/primary/rifle_ammo
	subcategory = OPS_SUBCATEGORY_RIFLE_AMMO
	max_purchase = 10
	cost = 1

/datum/armament_entry/assault_operatives/primary/rifle_ammo/rubber
	name = "\improper IGE-110 rubber magazine"
	description = "Винтовочные патроны, направленные на ослабление цели, нежели её убийство."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_rifle/rubber

/datum/armament_entry/assault_operatives/primary/rifle_ammo/ap
	name = "\improper IGE-110 armor piercing magazine"
	description = "Винтовочные патроны, созданные для пробивания брони."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_rifle/ap


/datum/armament_entry/assault_operatives/primary/submachinegun
	subcategory = OPS_SUBCATEGORY_SMG

/datum/armament_entry/assault_operatives/primary/submachinegun/assault_ops_smg
	item_type = /obj/item/gun/ballistic/automatic/assault_ops_smg

/datum/armament_entry/assault_operatives/primary/submachinegun_ammo
	subcategory = OPS_SUBCATEGORY_SMG_AMMO
	max_purchase = 10
	cost = 1

/datum/armament_entry/assault_operatives/primary/submachinegun_ammo/rubber
	name = "\improper IGE-260 rubber magazine"
	description = "Патроны ПП, направленные на ослабление цели, нежели её убийство."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_smg/rubber

/datum/armament_entry/assault_operatives/primary/submachinegun_ammo/hp
	name = "\improper IGE-260 hollowpoint magazine"
	description = "Патроны ПП, наносящие повышенный урон ценой уменьшенной пропускной способности."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_smg/hp

/datum/armament_entry/assault_operatives/primary/shotgun
	subcategory = OPS_SUBCATEGORY_SHOTGUN

/datum/armament_entry/assault_operatives/primary/shotgun/assault_ops_shotgun
	item_type = /obj/item/gun/ballistic/automatic/assault_ops_shotgun

/datum/armament_entry/assault_operatives/primary/shotgun_ammo
	subcategory = OPS_SUBCATEGORY_SHOTGUN_AMMO
	max_purchase = 10
	cost = 1

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/rubber
	name = "\improper IGE-340 rubbershot magazine"
	description = "Резиновые патроны для дробовика, направленные на ослабление цели, нежели её убийство."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_shotgun/rubbershot

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/flechette
	name = "\improper IGE-340 flechette magazine"
	description = "Бронебойные патроны для дробовика, способные нанести сильные раны."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_shotgun/flechette

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/hollowpoint
	name = "\improper IGE-340 hollowpoint slug magazine"
	description = "Крупнокалиберные пули для дробовика, наносящие больше урона небронированным целям ценой уменьшения пропускной способности."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_shotgun/hollowpoint

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/beehive
	name = "\improper IGE-340 'beehive' magazine"
	description = "Умно-рикошетные патроны для дробовика, направленные на ослабление цели, нежели её убийство."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_shotgun/beehive

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/dragonsbreath
	name = "\improper IGE-340 dragonsbreath magazine"
	description = "Поджигающие патроны для дробовика, которые создают стену огня на своём пути."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_shotgun/dragonsbreath

/datum/armament_entry/assault_operatives/primary/sniper
	subcategory = OPS_SUBCATEGORY_SNIPER

/datum/armament_entry/assault_operatives/primary/sniper/assault_ops_sniper
	item_type = /obj/item/gun/ballistic/rifle/boltaction/assault_ops_sniper

/datum/armament_entry/assault_operatives/primary/sniper_ammo
	subcategory = OPS_SUBCATEGORY_SNIPER_AMMO
	max_purchase = 10
	cost = 1

/datum/armament_entry/assault_operatives/primary/sniper_ammo/eepy
	name = "\improper IGE-410 soporific magazine"
	description = "Снайперские патроны, которые мгновенно усыпляют цель."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_sniper/sleepytime

/datum/armament_entry/assault_operatives/primary/sniper_ammo/penetrator
	name = "\improper IGE-410 penetrator magazine"
	description = "Снайперские патроны, способные к пробитию нескольких стен и людей одновременно."
	item_type = /obj/item/ammo_box/magazine/multi_sprite/assault_ops_sniper/penetrator

#undef OPS_SUBCATEGORY_RIFLE
#undef OPS_SUBCATEGORY_RIFLE_AMMO

#undef OPS_SUBCATEGORY_SMG
#undef OPS_SUBCATEGORY_SMG_AMMO

#undef OPS_SUBCATEGORY_SHOTGUN
#undef OPS_SUBCATEGORY_SHOTGUN_AMMO

#undef OPS_SUBCATEGORY_SNIPER
#undef OPS_SUBCATEGORY_SNIPER_AMMO
