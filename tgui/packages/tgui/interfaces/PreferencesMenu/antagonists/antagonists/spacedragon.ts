import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const SpaceDragon: Antagonist = {
  key: 'spacedragon',
  name: 'Космический дракон',
  description: [
    multiline`
      Станьте свирепым космическим драконом. Дышите огнем, призывайте армию
      космических карпов, крушите стены и наводите ужас на станцию.
    `,
  ],
  category: Category.Midround,
};

export default SpaceDragon;
