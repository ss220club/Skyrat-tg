import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';
import { OPERATIVE_MECHANICAL_DESCRIPTION } from './operative';

const ClownOperative: Antagonist = {
  key: 'clownoperative',
  name: 'Клоунский оперативник',
  description: [
    multiline`
      Хонк! Вы были выбраны, к лучшему или худшему, в синдикатовскую ударную группу
      клоунов. Ваша миссия, вне зависимости от ваших щекоток,
      заключается в отхонкивании самого передового
      исследовательского центра Nanotrasen!
      Правильно, вы отправитесь на клоунскую станцию 13.
    `,

    OPERATIVE_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default ClownOperative;
