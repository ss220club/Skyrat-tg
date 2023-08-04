/obj/item/clothing/under/rank/security/cp
	strip_delay = 50
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/obj/item/clothing/under/rank/cp/command
	name = "Униформа Командования"
	desc = "Уникальная униформа члена командного состава для полевых выходов. Обеспечивает незначительной защитой от биологической угрозы и значительной при ожоговых и режущих травм."
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	icon = 'modular_skyrat/master_files/icons/obj/clothing/uniforms.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/uniform.dmi'
	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/clothing/uniform_digi.dmi'
	worn_icon_teshari = 'modular_skyrat/master_files/icons/mob/clothing/species/teshari/uniform.dmi'
	icon_state = "nri_captain"
	inhand_icon_state = "hostrench"
	armor_type = /datum/armor/clothing_under/cp_command

/datum/armor/clothing_under/cp_command
	melee = 30
	fire = 80
	acid = 50
	wound = 30
	bio = 20
	bomb = 20

/obj/item/clothing/under/rank/cp/operative
	name = "Униформа Оперативника"
	desc = "Уникальная униформа оперативника предназначенная для ношения в особо опасных зонах боевых действий."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/uniforms.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/uniform.dmi'
	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/clothing/uniform_digi.dmi'
	worn_icon_teshari = 'modular_skyrat/master_files/icons/mob/clothing/species/teshari/uniform.dmi'
	icon_state = "nri_soldier"
	inhand_icon_state = "hostrench"
	armor_type = /datum/armor/clothing_under/cp_sec

/datum/armor/clothing_under/cp_sec
	melee = 30
	fire = 50
	acid = 20
	wound = 30
	bomb = 20

/obj/item/clothing/under/rank/cp/tech
	name = "Униформа Полевого Техника"
	desc = "Уникальная униформа полевого техника, изготовленного из огнеупорных и кислотоустойчивых материалов."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/uniforms.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/uniform.dmi'
	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/clothing/uniform_digi.dmi'
	worn_icon_teshari = 'modular_skyrat/master_files/icons/mob/clothing/species/teshari/uniform.dmi'
	icon_state = "nri_engineer"
	inhand_icon_state = "hostrench"
	armor_type = /datum/armor/clothing_under/cp_acid

/datum/armor/clothing_under/cp_acid
	bomb = 50
	fire = 80
	acid = 80

/obj/item/clothing/under/rank/cp/science
	name = "Униформа Научного Персонала"
	desc = "Уникальная униформа полевого техника, изготовленного из ткани обеспечивающей значительную защиту от биологической угрозы."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/uniforms.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/uniform.dmi'
	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/clothing/uniform_digi.dmi'
	worn_icon_teshari = 'modular_skyrat/master_files/icons/mob/clothing/species/teshari/uniform.dmi'
	icon_state = "nri_medic"
	inhand_icon_state = "hostrench"
	armor_type = /datum/armor/clothing_under/cp_bio

/datum/armor/clothing_under/cp_bio
	bio = 80
	acid = 30
