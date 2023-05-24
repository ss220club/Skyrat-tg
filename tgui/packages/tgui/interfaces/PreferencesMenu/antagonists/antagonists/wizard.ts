import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const WIZARD_MECHANICAL_DESCRIPTION = multiline`
      Выберайте из множества мощных заклинаний, чтобы вызвать хаос
      на космической станции 13.
    `;

const Wizard: Antagonist = {
  key: 'wizard',
  name: 'Маг',
  description: [
    `"GREETINGS. WE'RE THE WIZARDS OF THE WIZARD'S FEDERATION."`,
    WIZARD_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Wizard;
