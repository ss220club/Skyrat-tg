import { Antagonist, Category } from '../base';
import { TRAITOR_MECHANICAL_DESCRIPTION } from './traitor';

const SyndicateInfiltrator: Antagonist = {
  key: 'syndicateinfiltrator',
  name: 'Лазутчик Синдиката',
  description: [
    'Вариант предателя, который можно получить при прибытии на смену.',
    TRAITOR_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Latejoin,
  priority: -1,
};

export default SyndicateInfiltrator;
