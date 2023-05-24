import { multiline } from 'common/string';
import { Antagonist, Category } from '../base';
import { MALF_AI_MECHANICAL_DESCRIPTION } from './malfai';

const MalfAIMidround: Antagonist = {
  key: 'malfaimidround',
  name: 'Засбоивший ИИ',
  description: [
    multiline`
      Мидраунд вариант сбойного ИИ, которого могут получить существующие ИИ
      в любой момент во время смены.
    `,
    MALF_AI_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default MalfAIMidround;
