import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const SentientDisease: Antagonist = {
  key: 'sentientdisease',
  name: 'Разумная болезнь',
  description: [
    multiline`
      Митируйте, распространяйтесь и заразите как можно больше членов экипажа
      смертельно опасной чумой собственного создания.
    `,
  ],
  category: Category.Midround,
};

export default SentientDisease;
