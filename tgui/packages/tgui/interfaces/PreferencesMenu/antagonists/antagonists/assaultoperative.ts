import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

export const OPERATIVE_MECHANICAL_DESCRIPTION = multiline`
  Получите все возможные ключи аутентификации GoldenEye и используйте их для активации
  GoldenEye. Эти ключи используют фрагменты сознания глав Nanotrasen для генерации
  ключа. Используйте Interrogator, чтобы извлечь эти фрагменты сознания.
`;

const AssaultOperative: Antagonist = {
  key: 'assaultoperative',
  name: 'Штурмовой оперативник',
  description: [
    multiline`
      Добрый день, агент 0013. Вы были выбраны в элитную ударную группу, которой
      поручено найти и подделать ключи от GoldenEye. Ваша миссия - получить эти
      ключи и использовать их, чтобы обратить оборонительную сеть
      Nanotrasen GoldenEye против них самих. Для активации сети GoldenEye
      требуется 3 ключа.
    `,

    OPERATIVE_MECHANICAL_DESCRIPTION,
  ],
  category: Category.Roundstart,
};

export default AssaultOperative;
