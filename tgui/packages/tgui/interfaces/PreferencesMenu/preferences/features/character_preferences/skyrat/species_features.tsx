import { FeatureChoiced, FeatureDropdownInput, Feature, FeatureColorInput, FeatureTextInput, FeatureShortTextInput, CheckboxInput, FeatureTriColorInput, FeatureTriBoolInput, FeatureToggle, FeatureNumberInput, FeatureValueProps, FeatureChoicedServerData } from '../../base';

export const feature_leg_type: FeatureChoiced = {
  name: 'Тип ног',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor2: Feature<string> = {
  name: 'Цвет мутанта 2',
  component: FeatureColorInput,
};
export const feature_mcolor3: Feature<string> = {
  name: 'Цвет мутанта 3',
  component: FeatureColorInput,
};

export const flavor_text: Feature<string> = {
  name: 'Персонаж - описание',
  description: 'Распишите своего персонажа!',
  component: FeatureTextInput,
};

export const silicon_flavor_text: Feature<string> = {
  name: 'Персонаж - описание (силиконы)',
  description: 'Распишите своего киборга или ядро ИИ!',
  component: FeatureTextInput,
};

export const ooc_notes: Feature<string> = {
  name: 'OOC примечание',
  description: 'Расскажите о своем персонаже в OOC!',
  component: FeatureTextInput,
};

export const custom_species: Feature<string> = {
  name: 'Пользовательское имя вида',
  description:
    'Хотите необычное имя для вашего вида? Напишите его или оставьте поле пустым, если хотите использовать имя вашего вида по умолчанию.',
  component: FeatureShortTextInput,
};

export const custom_species_lore: Feature<string> = {
  name: 'Пользовательская история вида',
  description:
    'Напишите историю вашего вида! Не будет отображаться, если не выбран пользовательский вид.',
  component: FeatureTextInput,
};
// SKYRAT EDIT ADDITION BEGIN -- RECORDS REJUVINATION
export const general_record: Feature<string> = {
  name: 'Записи - Общие',
  description:
    'Ваши общие записи! Записи, предназначенные для общего ознакомления с вашей занятостью, квалификацией и т.д. Любой, у кого есть доступ к HUD/записям, может просматривать их.',
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
    'Ваши медицинские записи! Записи для истории болезней, рецептов, приказов DNR и т.д. Медицинский персонал может просматривать их.',
  component: FeatureTextInput,
};

export const exploitable_info: Feature<string> = {
  name: 'Записи - Компромат',
  description:
    'Раздел информации, для использования антагонистами против вас. Антагонисты смогут использовать эту информацию для увлечения вас в их игру различными взаимодействиями, не всегда доступные для среднестатистичного игрока с таким пустым полем.',
  component: FeatureTextInput,
};

export const pda_ringer: Feature<string> = {
  name: 'КПК - звуковое оповещение',
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
  name: 'Allow Mismatched Parts',
  description:
    'Want to go completely crazy with your character design? Use this to select any parts from any species!',
  component: CheckboxInput,
};

export const allow_genitals_toggle: FeatureToggle = {
  name: 'Allow Genital Parts',
  description: 'Enables if you want to have genitals on your character.',
  component: CheckboxInput,
};

export const allow_emissives_toggle: FeatureToggle = {
  name: 'Свечение',
  description: 'Пора блистать и озарять.',
  component: CheckboxInput,
};

export const eye_emissives: FeatureToggle = {
  name: 'Свечение глаз',
  description: 'Зажечь искру в глазах.',
  component: CheckboxInput,
};

export const mutant_colors_color: Feature<string[]> = {
  name: 'Цвет мутанта',
  description: 'Изменение цвета тела для не-людей.',
  component: FeatureTriColorInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: 'Отметины на теле',
  description:
    'Индивидуальность вашего тела! Не отображаются на не-пользовательских видах.',
  component: CheckboxInput,
};

export const feature_body_markings: Feature<string> = {
  name: 'Отметины на теле - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const body_markings_color: Feature<string[]> = {
  name: 'Отметины на теле - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const body_markings_emissive: Feature<boolean[]> = {
  name: 'Отметины на теле - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const tail_toggle: FeatureToggle = {
  name: 'Хвост',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_tail: Feature<string> = {
  name: 'Хвост - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const tail_color: Feature<string[]> = {
  name: 'Хвост - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const tail_emissive: Feature<boolean[]> = {
  name: 'Хвост - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const snout_toggle: FeatureToggle = {
  name: 'Морда',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_snout: Feature<string> = {
  name: 'Морда - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const snout_color: Feature<string[]> = {
  name: 'Морда - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const snout_emissive: Feature<boolean[]> = {
  name: 'Морда - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const horns_toggle: FeatureToggle = {
  name: 'Рога',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_horns: Feature<string> = {
  name: 'Рога - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const horns_color: Feature<string[]> = {
  name: 'Рога - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const horns_emissive: Feature<boolean[]> = {
  name: 'Рога - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const ears_toggle: FeatureToggle = {
  name: 'Уши',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_ears: Feature<string> = {
  name: 'Уши - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ears_color: Feature<string[]> = {
  name: 'Уши - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const ears_emissive: Feature<boolean[]> = {
  name: 'Уши - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const wings_toggle: FeatureToggle = {
  name: 'Крылья',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_wings: Feature<string> = {
  name: 'Крылья - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const wings_color: Feature<string[]> = {
  name: 'Крылья - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const wings_emissive: Feature<boolean[]> = {
  name: 'Крылья - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const frills_toggle: FeatureToggle = {
  name: 'Воротник',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_frills: Feature<string> = {
  name: 'Воротник - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const frills_color: Feature<string[]> = {
  name: 'Воротник - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const frills_emissive: Feature<boolean[]> = {
  name: 'Воротник - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const spines_toggle: FeatureToggle = {
  name: 'Шипы',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_spines: Feature<string> = {
  name: 'Шипы - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const spines_color: Feature<string[]> = {
  name: 'Шипы - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const spines_emissive: Feature<boolean[]> = {
  name: 'Шипы - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const digitigrade_legs: FeatureChoiced = {
  name: 'Ноги',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_toggle: FeatureToggle = {
  name: 'Колпак',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_caps: Feature<string> = {
  name: 'Колпак - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_color: Feature<string[]> = {
  name: 'Колпак - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const caps_emissive: Feature<boolean[]> = {
  name: 'Колпак - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const moth_antennae_toggle: FeatureToggle = {
  name: 'Антенна моли',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_moth_antennae: Feature<string> = {
  name: 'Антенна моли - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_antennae_color: Feature<string[]> = {
  name: 'Антенна моли - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const moth_antennae_emissive: Feature<boolean[]> = {
  name: 'Антенна моли - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const moth_markings_toggle: FeatureToggle = {
  name: 'Отметины моли',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_moth_markings: Feature<string> = {
  name: 'Отметины моли - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_markings_color: Feature<string[]> = {
  name: 'Отметины моли - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const moth_markings_emissive: Feature<boolean[]> = {
  name: 'Отметины моли - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const fluff_toggle: FeatureToggle = {
  name: 'Пух',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_fluff: Feature<string> = {
  name: 'Пух - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const fluff_color: Feature<string[]> = {
  name: 'Пух - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const fluff_emissive: Feature<boolean[]> = {
  name: 'Пух - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const head_acc_toggle: FeatureToggle = {
  name: 'Аксессуар для головы',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_head_acc: Feature<string> = {
  name: 'Аксессуар для головы - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const head_acc_color: Feature<string[]> = {
  name: 'Аксессуар для головы - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const head_acc_emissive: Feature<boolean[]> = {
  name: 'Аксессуар для головы - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const feature_ipc_screen: Feature<string> = {
  name: 'Экран КПБ',
  description:
    'The screen you wish to have displayed. If you have this set to "None", you won\'t get any screen at all.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_screen_color: Feature<string> = {
  name: 'Экран КПБ - цвет',
  description:
    "If your screen is greyscale enabled, then it'll take on this color.",
  component: FeatureColorInput,
};

export const ipc_screen_emissive: Feature<boolean> = {
  name: 'Экран КПБ - свечение',
  description: 'Want your screen to glow in the dark?',
  component: CheckboxInput,
};

export const ipc_antenna_toggle: FeatureToggle = {
  name: 'Синтетическая антенна',
  description: 'Want an antenna?',
  component: CheckboxInput,
};

export const feature_ipc_antenna: Feature<string> = {
  name: 'Синтетическая антенна - выбор',
  description: 'The antenna you want attached to your head.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_antenna_color: Feature<string[]> = {
  name: 'Синтетическая антенна - цвет',
  description:
    'The color you want your antenna to be. Some support multiple colors.',
  component: FeatureTriColorInput,
};

export const ipc_antenna_emissive: Feature<boolean[]> = {
  name: 'Синтетическая антенна - свечение',
  description: 'Want your antenna to glow in the dark?.',
  component: FeatureTriBoolInput,
};

export const feature_ipc_chassis: Feature<string> = {
  name: 'Синтетический корпус',
  description:
    "Allows customization of an Synth's chassis! Only works for Synths.",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_chassis_color: Feature<string> = {
  name: 'Синтетический корпус - цвет',
  description:
    "Allows customization of an Synth's chassis! Only works for Synths, for chassis that support greyscale coloring.",
  component: FeatureColorInput,
};

export const feature_ipc_head: Feature<string> = {
  name: 'Синтетическая голова',
  description:
    "Allows customization of an Synth's chassis! Only works for Synths.",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_head_color: Feature<string> = {
  name: 'Синтетическая голова - цвет',
  description:
    "Allows customization of an Synth's head! Only works for Synths, for heads that support greyscale coloring.",
  component: FeatureColorInput,
};

export const feature_hair_opacity_toggle: Feature<boolean> = {
  name: 'Непрозрачность волос',
  description: 'Enable the ability to override your hair opacity!',
  component: CheckboxInput,
};

export const feature_hair_opacity: Feature<number> = {
  name: 'Непрозрачность волос - уровень',
  description: 'Change your hair opacity! Hardlight hair, anyone?',
  component: FeatureNumberInput,
};

export const neck_acc_toggle: FeatureToggle = {
  name: 'Аксессуар для шеи',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_neck_acc: Feature<string> = {
  name: 'Аксессуар для шеи - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const neck_acc_color: Feature<string[]> = {
  name: 'Аксессуар для шеи - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const neck_acc_emissive: Feature<boolean[]> = {
  name: 'Аксессуар для шеи - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const skrell_hair_toggle: FeatureToggle = {
  name: 'Причёска скреллов',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_skrell_hair: Feature<string> = {
  name: 'Причёска скреллов - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const skrell_hair_color: Feature<string[]> = {
  name: 'Причёска скреллов - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const skrell_hair_emissive: Feature<boolean[]> = {
  name: 'Причёска скреллов - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const taur_toggle: FeatureToggle = {
  name: 'Тавр',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_taur: Feature<string> = {
  name: 'Тавр - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const taur_color: Feature<string[]> = {
  name: 'Тавр - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const taur_emissive: Feature<boolean[]> = {
  name: 'Тавр - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const xenodorsal_toggle: FeatureToggle = {
  name: 'Ксено-тыл',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_xenodorsal: Feature<string> = {
  name: 'Ксено-тыл - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenodorsal_color: Feature<string[]> = {
  name: 'Ксено-тыл - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const xenodorsal_emissive: Feature<boolean[]> = {
  name: 'Ксено-тыл - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const xenohead_toggle: FeatureToggle = {
  name: 'Ксено-голова',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_xenohead: Feature<string> = {
  name: 'Ксено-голова - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenohead_color: Feature<string[]> = {
  name: 'Ксено-голова - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const xenohead_emissive: Feature<boolean[]> = {
  name: 'Ксено-голова - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const undershirt_color: Feature<string> = {
  name: 'Цвет рубашки',
  component: FeatureColorInput,
};

export const socks_color: Feature<string> = {
  name: 'Цвет носков',
  component: FeatureColorInput,
};

export const heterochromia_toggle: FeatureToggle = {
  name: 'Гетерохромия',
  description:
    "Add some lore for your species! Won't show up if there's no custom species.",
  component: CheckboxInput,
};

export const feature_heterochromia: Feature<string> = {
  name: 'Гетерохромия - выбор',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const heterochromia_color: Feature<string[]> = {
  name: 'Гетерохромия - цвет',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriColorInput,
};

export const heterochromia_emissive: Feature<boolean[]> = {
  name: 'Гетерохромия - свечение',
  description:
    'Want to have a fancy species name? Put it here, or leave it blank.',
  component: FeatureTriBoolInput,
};

export const vox_bodycolor: Feature<string> = {
  name: 'Цвет тела воксов',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};
