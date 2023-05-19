import { multiline } from 'common/string';
import { Antagonist, Category } from '../base';

export const CONTRACTOR_MECHANICAL_DESCRIPTION = multiline`
      Отправляйтесь на станцию и выполните как можно
      больше контрактов для своего работодателя!
    `;

const DriftingContractor: Antagonist = {
  key: 'driftingcontractor',
  name: 'Контрактор',
  description: [
    multiline`
    Агент Синдиката, который может появиться рядом со станцией,
    оснащенный для выполнения контрактов для Синдиката.
    `,
    CONTRACTOR_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default DriftingContractor;
