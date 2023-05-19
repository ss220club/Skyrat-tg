import { multiline } from 'common/string';
import { Antagonist, Category } from '../base';

const LoneInfiltrator: Antagonist = {
  key: 'loneinfiltrator',
  name: 'Лазутчик-одиночка',
  description: [
    multiline`
    Мидраунд вариант предателя, который может появиться рядом со станцией,
    экипированный в МОД синдиката и со снаряжением,
    подобающим абордажнику станций. Отправляйтесь на станцию и
    выполните свои задачи.
    `,
  ],
  category: Category.Midround,
};

export default LoneInfiltrator;
