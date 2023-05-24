import { Antagonist, Category } from '../base';
import { TRAITOR_MECHANICAL_DESCRIPTION } from './traitor';
import { multiline } from 'common/string';

const SyndicateSleeperAgent: Antagonist = {
  key: 'syndicatesleeperagent',
  name: 'Спящий агент Синдиката',
  description: [
    multiline`
      Вариант предателя, который можно получить в любой момент во время смены.
    `,
    TRAITOR_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
  priority: -1,
};

export default SyndicateSleeperAgent;
