import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const Nightmare: Antagonist = {
  key: 'nightmare',
  name: 'Кошмар',
  description: [
    multiline`
      Используйте свой клинок для уничтожения источников света,
      чтобы жить и процветать. Пробирайтесь сквозь тьму и
      ищите добычу с помощью ночного зрения.
    `,
  ],
  category: Category.Midround,
};

export default Nightmare;
