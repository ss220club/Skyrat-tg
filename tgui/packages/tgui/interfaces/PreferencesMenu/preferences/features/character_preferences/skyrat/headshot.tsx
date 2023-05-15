import { Feature, FeatureShortTextInput } from '../../base';

export const headshot: Feature<string> = {
  name: 'Фото профиля',
  description:
    'Прикрепить к своему персонажу изображение, видимое при ближайшем рассмотрении. Требует правильного оформления.',
  component: FeatureShortTextInput,
};
