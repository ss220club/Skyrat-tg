import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';
import { OPERATIVE_MECHANICAL_DESCRIPTION } from './operative';

const LoneOperative: Antagonist = {
  key: 'loneoperative',
  name: 'Оперативник-одиночка',
  description: [
    multiline`
      Шанс появления ядерного оперативника повышается в зависимости от того,
      насколько долго диск ядерной аутентификации находится на одном месте.
    `,

    OPERATIVE_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default LoneOperative;
