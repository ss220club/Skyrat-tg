import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const CHANGELING_MECHANICAL_DESCRIPTION = multiline`
Превращайтесь или превращайте в других и покупайте арсенал
биологического оружия с помощью собранной ДНК.
`;

const Changeling: Antagonist = {
  key: 'changeling',
  name: 'Генокрад',
  description: [
    multiline`
      Разумный инопланетный хищник, способный изменять свою форму,
      чтобы безупречно походить на человека.
    `,
    CHANGELING_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Changeling;
