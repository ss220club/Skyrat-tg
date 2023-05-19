import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const OPERATIVE_MECHANICAL_DESCRIPTION = multiline`
  Вытащите диск ядерной аутентификации и используйте его,
  чтобы активировать ядерную бомбу для уничтожения станцию.
`;

const Operative: Antagonist = {
  key: 'operative',
  name: 'Ядерный оперативник',
  description: [
    multiline`
      Congratulations, agent. You have been chosen to join the Syndicate
      Nuclear Operative strike team. Your mission, whether or not you choose
      to accept it, is to destroy Nanotrasen's most advanced research facility!
      That's right, you're going to Space Station 13.

      Поздравляю, агент. Вы были выбраны в синдикатовскую ударную группу
      ядерных оперативников. Ваша миссия, вне зависимости от вашего решения,
      заключается в уничтожении самого передового
      исследовательского центра Nanotrasen!
      Правильно, вы отправитесь на космическую станцию 13.
    `,

    OPERATIVE_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default Operative;
