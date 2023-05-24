import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const Xenomorph: Antagonist = {
  key: 'xenomorph',
  name: 'Ксеноморф',
  description: [
    multiline`
      Станьте внеземным ксеноморфом. Начните как ларва и продвигайтесь
      по касте, вплоть до Королевы!
    `,
  ],
  category: Category.Midround,
};

export default Xenomorph;
