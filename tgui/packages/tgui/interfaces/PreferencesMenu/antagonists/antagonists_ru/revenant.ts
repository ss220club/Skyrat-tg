import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const Revenant: Antagonist = {
  key: 'revenant',
  name: 'Ревенант',
  description: [
    multiline`
      Станьте таинственным ревенантом. Разбивайте окна, перегружайте свет
      и питайтесь жизненной силой экипажа, общаясь при этом со своей
      старой общиной недовольных призраков.
    `,
  ],
  category: Category.Midround,
};

export default Revenant;
