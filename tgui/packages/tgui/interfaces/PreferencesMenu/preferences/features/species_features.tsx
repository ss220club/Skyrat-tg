import { FeatureColorInput, Feature, FeatureChoiced, FeatureDropdownInput, FeatureValueProps, FeatureChoicedServerData } from './base';

export const eye_color: Feature<string> = {
  name: 'Цвет глаз',
  component: FeatureColorInput,
};

export const facial_hair_color: Feature<string> = {
  name: 'Лицевая растительность - цвет',
  component: FeatureColorInput,
};

export const facial_hair_gradient: FeatureChoiced = {
  name: 'Лицевая растительность - градиент',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const facial_hair_gradient_color: Feature<string> = {
  name: 'Лицевая растительность - цвет градиента',
  component: FeatureColorInput,
};

export const hair_color: Feature<string> = {
  name: 'Волосы - цвет',
  component: FeatureColorInput,
};

export const hair_gradient: FeatureChoiced = {
  name: 'Волосы - градиент',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const hair_gradient_color: Feature<string> = {
  name: 'Волосы - цвет градиента',
  component: FeatureColorInput,
};

export const feature_human_ears: FeatureChoiced = {
  name: 'Уши',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_human_tail: FeatureChoiced = {
  name: 'Хвост',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_legs: FeatureChoiced = {
  name: 'Ноги',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_spines: FeatureChoiced = {
  name: 'Шипы',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_lizard_tail: FeatureChoiced = {
  name: 'Хвост',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor: Feature<string> = {
  name: 'Цвет мутанта',
  component: FeatureColorInput,
};

export const underwear_color: Feature<string> = {
  name: 'Цвет нижнего белья',
  component: FeatureColorInput,
};

export const feature_vampire_status: Feature<string> = {
  name: 'Статус вампира',
  component: FeatureDropdownInput,
};

export const heterochromatic: Feature<string> = {
  name: 'Цвет гетерохромии (правый глаз)',
  component: FeatureColorInput,
};
