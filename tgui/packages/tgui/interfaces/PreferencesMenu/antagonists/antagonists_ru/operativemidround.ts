import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';
import { OPERATIVE_MECHANICAL_DESCRIPTION } from './operative';

const OperativeMidround: Antagonist = {
  key: 'operativemidround',
  name: 'Ядерный штурмовик',
  description: [
    multiline`
      Мидраунд вариант ядерного оперативника, который набирается среди призраков.
    `,
    OPERATIVE_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default OperativeMidround;
