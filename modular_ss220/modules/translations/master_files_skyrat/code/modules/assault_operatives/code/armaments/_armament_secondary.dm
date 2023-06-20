#define OPS_SUBCATEGORY_LETHAL_SIDE "Летальное"
#define OPS_SUBCATEGORY_NONLETHAL_SIDE "Не летальное"
#define OPS_SUBCATEGORY_MARTIAL_SIDE "Боевые искусства"

/datum/armament_entry/assault_operatives/secondary
	category = "Вторичное оружие"

/datum/armament_entry/assault_operatives/secondary/lethal
	subcategory = OPS_SUBCATEGORY_LETHAL_SIDE

/datum/armament_entry/assault_operatives/secondary/nonlethal
	subcategory = OPS_SUBCATEGORY_NONLETHAL_SIDE

/datum/armament_entry/assault_operatives/secondary/martial
	subcategory = OPS_SUBCATEGORY_MARTIAL_SIDE

#undef OPS_SUBCATEGORY_LETHAL_SIDE
#undef OPS_SUBCATEGORY_NONLETHAL_SIDE
#undef OPS_SUBCATEGORY_MARTIAL_SIDE
