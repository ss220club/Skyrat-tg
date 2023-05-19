import { Antagonist, Category } from '../base';
import { BLOB_MECHANICAL_DESCRIPTION } from './blob';
import { multiline } from 'common/string';

const BlobInfection: Antagonist = {
  key: 'blobinfection',
  name: 'Блоб инфекция',
  description: [
    multiline`
      В любой момент посреди смены вас поразит инфекция,
      которая превратит вас в ужасающего блоба.
    `,
    BLOB_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Midround,
};

export default BlobInfection;
