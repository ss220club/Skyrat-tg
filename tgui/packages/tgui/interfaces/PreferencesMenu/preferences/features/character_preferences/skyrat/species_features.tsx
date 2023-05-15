import { FeatureChoiced, FeatureDropdownInput, Feature, FeatureColorInput, FeatureTextInput, FeatureShortTextInput, CheckboxInput, FeatureTriColorInput, FeatureTriBoolInput, FeatureToggle, FeatureNumberInput } from '../../base';

export const feature_leg_type: FeatureChoiced = {
  name: 'Тип Ног',
  component: FeatureDropdownInput,
};

export const feature_mcolor2: Feature<string> = {
  name: 'Цвет Мутанта 2',
  component: FeatureColorInput,
};
export const feature_mcolor3: Feature<string> = {
  name: 'Цвет Мутанта 3',
  component: FeatureColorInput,
};

export const flavor_text: Feature<string> = {
  name: 'Описание',
  description: 'Распишите своего персонажа!',
  component: FeatureTextInput,
};

export const silicon_flavor_text: Feature<string> = {
  name: 'Описание (Силиконы)',
  description: 'Распишите своего киборга или ядро ИИ!',
  component: FeatureTextInput,
};

export const ooc_notes: Feature<string> = {
  name: 'OOC Примечание',
  description: 'Расскажите о своем персонаже в OOC!',
  component: FeatureTextInput,
};

export const custom_species: Feature<string> = {
  name: 'Пользовательское Имя Вида',
  description:
    'Хотите необычное имя для вашего вида? Напишите его или оставьте поле пустым, если хотите использовать имя вашего вида по умолчанию.',
  component: FeatureShortTextInput,
};

export const custom_species_lore: Feature<string> = {
  name: 'Пользовательская История Вида',
  description:
    'Напишите историю вашего вида! Не будет отображаться, если не пользовательский вид.',
  component: FeatureTextInput,
};
// SKYRAT EDIT ADDITION BEGIN -- RECORDS REJUVINATION
export const general_record: Feature<string> = {
  name: 'Записи - Общие',
  description:
    'Ваши общие записи! Записи, предназначенные для общего ознакомления с вашей занятостью, квалификацией и т. д. Любой, у кого есть доступ к HUD/записям, может просматривать их.',
  component: FeatureTextInput,
};

export const security_record: Feature<string> = {
  name: 'Записи - Безопасность',
  description:
    'Ваши записи службы безопасности! Записи о судимости, история арестов и тому подобное. Офицеры службы безопасности могут просматривать их.',
  component: FeatureTextInput,
};

export const medical_record: Feature<string> = {
  name: 'Записи - Медицина',
  description:
    'Ваши медицинские записи! Записи для истории болезней, рецептов, приказов DNR и т. д. Медицинский персонал может просматривать их.',
  component: FeatureTextInput,
};

export const exploitable_info: Feature<string> = {
  name: 'Записи - Компромат',
  description:
    'Раздел информации, для использования антагонистами против вас. Антагонисты смогут использовать эту информацию для увлечения вас в их игру различными взаимодействиями, не всегда доступные для среднего игрока с таким пустым полем.',
  component: FeatureTextInput,
};

export const pda_ringer: Feature<string> = {
  name: 'КПК Звуковое Оповещение',
  description:
    'Хотите звуковое оповещение о новом сообщении отличимое от "beep"? Допустимо 20 символов.',
  component: FeatureShortTextInput,
};

export const background_info: Feature<string> = {
  name: 'Записи - Фон',
  description: 'Оно просто есть и непонятно для чего используется.',
  component: FeatureTextInput,
};
// SKYRAT EDIT END
export const allow_mismatched_parts_toggle: FeatureToggle = {
  name: 'Разрешить Несовместимые Части',
  description:
    'Собери своего собственного покемота для устрашения своих врагов. ВНИМАНИЕ! Вычурный вид может привести к блокировке. Не перебарщивайте.',
  component: CheckboxInput,
};

export const allow_genitals_toggle: FeatureToggle = {
  name: 'Разрешить Половые Органы',
  description: 'Включить для самоубиения.',
  component: CheckboxInput,
};

export const allow_emissives_toggle: FeatureToggle = {
  name: 'Свечение',
  description: 'Пора блистать и озарять.',
  component: CheckboxInput,
};

export const eye_emissives: FeatureToggle = {
  name: 'Свечение Глаз',
  description: 'Зажечь искру в глазах.',
  component: CheckboxInput,
};

export const mutant_colors_color: Feature<string[]> = {
  name: 'Цвет Мутанта',
  description: 'Управление устаревшими цветами.',
  component: FeatureTriColorInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: 'Отметины на теле',
  description:
    'Индивидуальность вашего тела! Не отображаются на не-пользовательских видах.',
  component: CheckboxInput,
};

export const feature_body_markings: Feature<string> = {
  name: 'Выбор отметин на теле',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const body_markings_color: Feature<string[]> = {
  name: 'Цвета отметин на теле',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const body_markings_emissive: Feature<boolean[]> = {
  name: 'Свечение отметин на теле',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const tail_toggle: FeatureToggle = {
  name: 'Хвост',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_tail: Feature<string> = {
  name: 'Выбор Хвоста',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const tail_color: Feature<string[]> = {
  name: 'Цвета Хвоста',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const tail_emissive: Feature<boolean[]> = {
  name: 'Свечение Хвоста',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const snout_toggle: FeatureToggle = {
  name: 'Морда',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_snout: Feature<string> = {
  name: 'Выбор Морды',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const snout_color: Feature<string[]> = {
  name: 'Цвета Морды',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const snout_emissive: Feature<boolean[]> = {
  name: 'Свечение Морды',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const horns_toggle: FeatureToggle = {
  name: 'Рога',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_horns: Feature<string> = {
  name: 'Выбор Рога',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const horns_color: Feature<string[]> = {
  name: 'Цвета Рога',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const horns_emissive: Feature<boolean[]> = {
  name: 'Свечение Рога',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const ears_toggle: FeatureToggle = {
  name: 'Уши',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_ears: Feature<string> = {
  name: 'Выбор Ушей',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const ears_color: Feature<string[]> = {
  name: 'Цвета Ушей',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const ears_emissive: Feature<boolean[]> = {
  name: 'Свечение Ушей',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const wings_toggle: FeatureToggle = {
  name: 'Крылья',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_wings: Feature<string> = {
  name: 'Выбор Крыльев',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const wings_color: Feature<string[]> = {
  name: 'Цвета Крыльев',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const wings_emissive: Feature<boolean[]> = {
  name: 'Свечение Крыльев',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const frills_toggle: FeatureToggle = {
  name: 'Воротник',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_frills: Feature<string> = {
  name: 'Выбор Воротника',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const frills_color: Feature<string[]> = {
  name: 'Цвет Воротника',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const frills_emissive: Feature<boolean[]> = {
  name: 'Свечение Воротника',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const spines_toggle: FeatureToggle = {
  name: 'Шипы',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_spines: Feature<string> = {
  name: 'Выбор Шипов',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const spines_color: Feature<string[]> = {
  name: 'Цвет Шипов',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const spines_emissive: Feature<boolean[]> = {
  name: 'Свечение Шипов',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const digitigrade_legs: FeatureChoiced = {
  name: 'Ноги',
  component: FeatureDropdownInput,
};

export const caps_toggle: FeatureToggle = {
  name: 'Колпак',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_caps: Feature<string> = {
  name: 'Выбор Колпака',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const caps_color: Feature<string[]> = {
  name: 'Цвет Колпака',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const caps_emissive: Feature<boolean[]> = {
  name: 'Свечение Колпака',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const moth_antennae_toggle: FeatureToggle = {
  name: 'Антенны Мотылька',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_moth_antennae: Feature<string> = {
  name: 'Выбор Антенн Мотылька',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const moth_antennae_color: Feature<string[]> = {
  name: 'Цвет Антенн Мотылька',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const moth_antennae_emissive: Feature<boolean[]> = {
  name: 'Свечение Антенн Мотылька',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const moth_markings_toggle: FeatureToggle = {
  name: 'Отметины Мотылька',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_moth_markings: Feature<string> = {
  name: 'Выбор Отметины Мотылька',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const moth_markings_color: Feature<string[]> = {
  name: 'Цвет Отметины Мотылька',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const moth_markings_emissive: Feature<boolean[]> = {
  name: 'Свечение Отметины Мотылька',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const fluff_toggle: FeatureToggle = {
  name: 'Пух',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_fluff: Feature<string> = {
  name: 'Выбор Пуха',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const fluff_color: Feature<string[]> = {
  name: 'Цвет Пуха',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const fluff_emissive: Feature<boolean[]> = {
  name: 'Свечение Пуха',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const head_acc_toggle: FeatureToggle = {
  name: 'Аксессуар для Головы',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_head_acc: Feature<string> = {
  name: 'Выбор Аксессуара для Головы',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const head_acc_color: Feature<string[]> = {
  name: 'Цвет Аксессуара для Головы',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const head_acc_emissive: Feature<boolean[]> = {
  name: 'Свечение Аксессуара для Головы',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const feature_ipc_screen: Feature<string> = {
  name: 'Выбор Экрана КПБ',
  description: 'Визуальный экран. При отсутствии - экрана не будет.',
  component: FeatureDropdownInput,
};

export const ipc_screen_color: Feature<string> = {
  name: 'Цвет Экрана КПБ',
  description:
    'Если на вашем экране включены оттенки серого, он примет этот цвет.',
  component: FeatureColorInput,
};

export const ipc_screen_emissive: Feature<boolean> = {
  name: 'Свечение Экрана КПБ',
  description: 'Светящийся в темноте экран?',
  component: CheckboxInput,
};

export const ipc_antenna_toggle: FeatureToggle = {
  name: 'Синтетическая Антенна',
  description: 'Нуждаетесь в антенне?',
  component: CheckboxInput,
};

export const feature_ipc_antenna: Feature<string> = {
  name: 'Выбор Синтетической Антенны',
  description: 'Антенна цепляемая к голове.',
  component: FeatureDropdownInput,
};

export const ipc_antenna_color: Feature<string[]> = {
  name: 'Цвет Синтетической Антенны',
  description: 'Цвет для вашей антенны. Возможны несколько цветов.',
  component: FeatureTriColorInput,
};

export const ipc_antenna_emissive: Feature<boolean[]> = {
  name: 'Свечение Синтетической Антенны',
  description: 'Хотите светящуюся в темноте антенну?',
  component: FeatureTriBoolInput,
};

export const feature_ipc_chassis: Feature<string> = {
  name: 'Выбор Синтетического Корпуса',
  description: 'Настройте своего синтетика!',
  component: FeatureDropdownInput,
};

export const ipc_chassis_color: Feature<string> = {
  name: 'Цвет Синтетического Корпуса',
  description:
    'Настройте своего синтетика! Поддерживает перекраску серых оттенков.',
  component: FeatureColorInput,
};

export const feature_ipc_head: Feature<string> = {
  name: 'Выбор Синтетической Головы',
  description: 'Настройте своего синтетика!',
  component: FeatureDropdownInput,
};

export const ipc_head_color: Feature<string> = {
  name: 'Цвет Синтетической Головы',
  description:
    'Настройте своего синтетика! Поддерживает перекраску серых оттенков.',
  component: FeatureColorInput,
};

export const feature_hair_opacity_toggle: Feature<boolean> = {
  name: 'Непрозрачность Волос',
  description: 'Включите возможность переопределить непрозрачность волос!',
  component: CheckboxInput,
};

export const feature_hair_opacity: Feature<number> = {
  name: 'Непрозрачность Волос',
  description:
    'Измените непрозрачность волос! Но может всё-таки остановимся на жестких волосах?',
  component: FeatureNumberInput,
};

export const neck_acc_toggle: FeatureToggle = {
  name: 'Аксессуар для Шеи',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_neck_acc: Feature<string> = {
  name: 'Выбор Аксессуара для Шеи',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const neck_acc_color: Feature<string[]> = {
  name: 'Цвет Аксессуара для Шеи',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const neck_acc_emissive: Feature<boolean[]> = {
  name: 'Свечение Аксессуара для Шеи',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const skrell_hair_toggle: FeatureToggle = {
  name: 'Прическа Скреллов',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_skrell_hair: Feature<string> = {
  name: 'Выбор Прически Скреллов',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const skrell_hair_color: Feature<string[]> = {
  name: 'Цвет Прически Скреллов',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const skrell_hair_emissive: Feature<boolean[]> = {
  name: 'Свечение Прически Скреллов',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const taur_toggle: FeatureToggle = {
  name: 'Тавр',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_taur: Feature<string> = {
  name: 'Выбор Тавра',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const taur_color: Feature<string[]> = {
  name: 'Цвет Тавра',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const taur_emissive: Feature<boolean[]> = {
  name: 'Свечение Тавра',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const xenodorsal_toggle: FeatureToggle = {
  name: 'Ксено-тыл',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_xenodorsal: Feature<string> = {
  name: 'Выбор Ксено-тыла',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const xenodorsal_color: Feature<string[]> = {
  name: 'Цвет Ксено-тыла',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const xenodorsal_emissive: Feature<boolean[]> = {
  name: 'Свечение Ксено-тыла',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const xenohead_toggle: FeatureToggle = {
  name: 'Ксено-голова',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_xenohead: Feature<string> = {
  name: 'Выбор Ксено-головы',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const xenohead_color: Feature<string[]> = {
  name: 'Цвет Ксено-головы',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const xenohead_emissive: Feature<boolean[]> = {
  name: 'Свечение Ксено-головы',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const undershirt_color: Feature<string> = {
  name: 'Цвет Рубашки',
  component: FeatureColorInput,
};

export const socks_color: Feature<string> = {
  name: 'Цвет Носков',
  component: FeatureColorInput,
};

export const heterochromia_toggle: FeatureToggle = {
  name: 'Гетерохромия',
  description:
    'Придайте индивидуальности вашему виду! Не отображается на не-пользовательском виде.',
  component: CheckboxInput,
};

export const feature_heterochromia: Feature<string> = {
  name: 'Выбор Гетерохромии',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureDropdownInput,
};

export const heterochromia_color: Feature<string[]> = {
  name: 'Цвет Гетерохромии',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriColorInput,
};

export const heterochromia_emissive: Feature<boolean[]> = {
  name: 'Свечение Гетерохромии',
  description: 'Хотите необычный вид? Выберите или оставьте пустым.',
  component: FeatureTriBoolInput,
};

export const vox_bodycolor: Feature<string> = {
  name: 'Цвет тела Вокса',
  component: FeatureDropdownInput,
};
