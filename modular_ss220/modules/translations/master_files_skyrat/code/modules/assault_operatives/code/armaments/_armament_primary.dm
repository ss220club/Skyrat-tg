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

/datum/armament_entry/assault_operatives/primary/rifle
	subcategory = OPS_SUBCATEGORY_RIFLE

/datum/armament_entry/assault_operatives/primary/rifle_ammo
	subcategory = OPS_SUBCATEGORY_RIFLE_AMMO

/datum/armament_entry/assault_operatives/primary/rifle_ammo/rubber
	description = "Винтовочные патроны, направленные на ослабление цели, нежели её убийство."

/datum/armament_entry/assault_operatives/primary/rifle_ammo/ap
	description = "Винтовочные патроны, созданные для пробивания брони."

/datum/armament_entry/assault_operatives/primary/submachinegun
	subcategory = OPS_SUBCATEGORY_SMG

/datum/armament_entry/assault_operatives/primary/submachinegun_ammo
	subcategory = OPS_SUBCATEGORY_SMG_AMMO

/datum/armament_entry/assault_operatives/primary/submachinegun_ammo/rubber
	description = "Патроны ПП, направленные на ослабление цели, нежели её убийство."

/datum/armament_entry/assault_operatives/primary/submachinegun_ammo/hp
	description = "Патроны ПП, наносящие повышенный урон ценой уменьшенной пропускной способности."

/datum/armament_entry/assault_operatives/primary/shotgun
	subcategory = OPS_SUBCATEGORY_SHOTGUN

/datum/armament_entry/assault_operatives/primary/shotgun_ammo
	subcategory = OPS_SUBCATEGORY_SHOTGUN_AMMO

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/rubber
	description = "Резиновые патроны для дробовика, направленные на ослабление цели, нежели её убийство."

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/flechette
	description = "Бронебойные патроны для дробовика, способные нанести сильные раны."

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/hollowpoint
	description = "Крупнокалиберные пули для дробовика, наносящие больше урона небронированным целям ценой уменьшения пропускной способности."

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/beehive
	description = "Умно-рикошетные патроны для дробовика, направленные на ослабление цели, нежели её убийство."

/datum/armament_entry/assault_operatives/primary/shotgun_ammo/dragonsbreath
	description = "Поджигающие патроны для дробовика, которые создают стену огня на своём пути."

/datum/armament_entry/assault_operatives/primary/sniper
	subcategory = OPS_SUBCATEGORY_SNIPER

/datum/armament_entry/assault_operatives/primary/sniper_ammo
	subcategory = OPS_SUBCATEGORY_SNIPER_AMMO

/datum/armament_entry/assault_operatives/primary/sniper_ammo/eepy // А ТАКИХ ПУЛЕЙ ВРОДЕ НЕТ БОЛЬШЕ?
	description = "Снайперские патроны, которые мгновенно усыпляют цель."

/datum/armament_entry/assault_operatives/primary/sniper_ammo/penetrator
	description = "Снайперские патроны, способные к пробитию нескольких стен и людей одновременно."

#undef OPS_SUBCATEGORY_RIFLE
#undef OPS_SUBCATEGORY_RIFLE_AMMO

#undef OPS_SUBCATEGORY_SMG
#undef OPS_SUBCATEGORY_SMG_AMMO

#undef OPS_SUBCATEGORY_SHOTGUN
#undef OPS_SUBCATEGORY_SHOTGUN_AMMO

#undef OPS_SUBCATEGORY_SNIPER
#undef OPS_SUBCATEGORY_SNIPER_AMMO
