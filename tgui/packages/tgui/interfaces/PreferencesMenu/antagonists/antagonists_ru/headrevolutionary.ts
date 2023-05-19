import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const REVOLUTIONARY_MECHANICAL_DESCRIPTION = multiline`
      Вооружившись флэшем, обратите в революцию как можно больше людей.
      Убейте или изгоните всех глав станции.
   `;

const HeadRevolutionary: Antagonist = {
  key: 'headrevolutionary',
  name: 'Глава революции',
  description: ['VIVA LA REVOLUTION!', REVOLUTIONARY_MECHANICAL_DESCRIPTION],
  category: Category.Roundstart,
};

export default HeadRevolutionary;
