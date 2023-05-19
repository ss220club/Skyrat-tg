import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const HERETIC_MECHANICAL_DESCRIPTION = multiline`
      Найдите скрытые влияния и принесите в жертву членов экипажа,
      чтобы получить магические силы и возвыситься по одному из нескольких путей.
   `;

const Heretic: Antagonist = {
  key: 'heretic',
  name: 'Еретик',
  description: [
    multiline`
      Забыты, поглощенны, выпотрошены. Человечество забыло о мистических силах
      разложения, но завеса Мансуса ослабла. Мы заставим их снова
      почувствовать вкус страха...
    `,
    HERETIC_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Heretic;
