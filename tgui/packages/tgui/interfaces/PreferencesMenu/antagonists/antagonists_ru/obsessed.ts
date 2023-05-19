import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const Obsessed: Antagonist = {
  key: 'obsessed',
  name: 'Одержимый',
  description: [
    multiline`
    Вы кем-то одержимы! Ваша цель одержимости может начать замечать,
    что их личные вещи украдены, а коллеги пропали,
    но поймут ли они вовремя, что они - ваша следующая жертва?
    `,
  ],
  category: Category.Midround,
};

export default Obsessed;
