import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';
import { CHANGELING_MECHANICAL_DESCRIPTION } from './changeling';

const ChangelingMidround: Antagonist = {
  key: 'changelingmidround',
  name: 'Генокрад с космоса',
  description: [
    multiline`
    Мидраунд вариант генокрада, который не получает личность экипажа,
    а прибывает из космоса. Эта версия сложнее, чем начинающаяся в начале смены!
    `,
    CHANGELING_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default ChangelingMidround;
