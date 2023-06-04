import { useBackend } from '../backend';
import { multiline } from 'common/string';
import { BlockQuote, Button, Dimmer, Section, Stack } from '../components';
import { BooleanLike } from 'common/react';
import { Window } from '../layouts';

const allystyle = {
  fontWeight: 'bold',
  color: 'yellow',
};

const badstyle = {
  color: 'red',
  fontWeight: 'bold',
};

const goalstyle = {
  color: 'lightblue',
  fontWeight: 'bold',
};

type Objective = {
  count: number;
  name: string;
  explanation: string;
};

type Info = {
  has_codewords: BooleanLike;
  phrases: string;
  responses: string;
  theme: string;
  allies: string;
  goal: string;
  intro: string;
  code: string;
  failsafe_code: string;
  replacement_code: string;
  replacement_frequency: string;
  has_uplink: BooleanLike;
  uplink_intro: string;
  uplink_unlock_info: string;
  objectives: Objective[];
};

const ObjectivePrintout = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { objectives } = data;
  return (
    <Stack vertical>
      <Stack.Item bold>Ваши текущие задачи:</Stack.Item>
      <Stack.Item>
        {(!objectives && 'None!') ||
          objectives.map((objective) => (
            <Stack.Item key={objective.count}>
              #{objective.count}: {objective.explanation}
            </Stack.Item>
          ))}
      </Stack.Item>
    </Stack>
  );
};

const IntroductionSection = (props, context) => {
  const { act, data } = useBackend<Info>(context);
  const { intro } = data;
  return (
    <Section fill title="Введение" scrollable>
      <Stack vertical fill>
        <Stack.Item fontSize="25px">{intro}</Stack.Item>
        <Stack.Item grow>
          <ObjectivePrintout />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const EmployerSection = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { allies, goal } = data;
  return (
    <Section
      fill
      title="Наниматель"
      scrollable
      buttons={
        <Button
          icon="hammer"
          tooltip={multiline`
            Это внутриигровое предложение для заскучавших предателей.
            Вы не обязаны следовать ему, если только вы не хотите
            использовать это для генерации идей для раунда.`}
          tooltipPosition="bottom-start">
          Политика
        </Button>
      }>
      <Stack vertical fill>
        <Stack.Item grow>
          <Stack vertical>
            <Stack.Item>
              <span style={allystyle}>
                Ваши обязанности:
                <br />
              </span>
              <BlockQuote>{allies}</BlockQuote>
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item>
              <span style={goalstyle}>
                От нанимателя:
                <br />
              </span>
              <BlockQuote>{goal}</BlockQuote>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const UplinkSection = (props, context) => {
  const { data } = useBackend<Info>(context);
  const {
    has_uplink,
    uplink_intro,
    uplink_unlock_info,
    code,
    failsafe_code,
    replacement_code,
    replacement_frequency,
  } = data;
  return (
    <Section title="Аплинк" mb={!has_uplink && -1}>
      <Stack fill>
        {(!has_uplink && (
          <Dimmer>
            <Stack.Item fontSize="16px">
              <Section textAlign="Center">
                Ваш аплинк отсутствует или уничтожен. <br />
                Создайте синдикатовский маячок аплинка и скажите
                <br />
                <span style={goalstyle}>
                  <b>{replacement_code}</b>
                </span>{' '}
                по частоте{' '}
                <span style={goalstyle}>
                  <b>{replacement_frequency}</b>
                </span>{' '}
                после синхронизации с маячком.
              </Section>
            </Stack.Item>
          </Dimmer>
        )) || (
          <>
            <Stack.Item bold>
              {uplink_intro}
              <br />
              {code && <span style={goalstyle}>Код: {code}</span>}
              <br />
              {failsafe_code && (
                <span style={badstyle}>Запасной код: {failsafe_code}</span>
              )}
            </Stack.Item>
            <Stack.Divider />
            <Stack.Item mt="1%">
              <BlockQuote>{uplink_unlock_info}</BlockQuote>
            </Stack.Item>
          </>
        )}
      </Stack>
      <br />
      {(has_uplink && (
        <Section textAlign="Center">
          Если вы потеряете свой аплнинк, создайте синдикатовский маячок аплинка
          и скажите{' '}
          <span style={goalstyle}>
            <b>{replacement_code}</b>
          </span>{' '}
          по радио-частоте{' '}
          <span style={goalstyle}>
            <b>{replacement_frequency}</b>
          </span>{' '}
          после синхронизации с маячком.
        </Section>
      )) || (
        <Section>
          {' '}
          <br />
          <br />
        </Section>
      )}
    </Section>
  );
};

const CodewordsSection = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { has_codewords, phrases, responses } = data;
  return (
    <Section title="Кодовые слова" mb={!has_codewords && -1}>
      <Stack fill>
        {(!has_codewords && (
          <BlockQuote>
            Вам не были предоставлены кодовые слова. Вы должны использовать
            альтернативные способы поиска потенциальных союзников. Но будьте
            осторожны, так как каждый может быть потенциальным противником.
          </BlockQuote>
        )) || (
          <>
            <Stack.Item grow basis={0}>
              <BlockQuote>
                Ваш наниматель предоставил вам кодовые слова для идентификации
                других агентов. Используйте слова во время обычных разговора,
                если считаете, что говорите с агентом. Но будьте осторожны, так
                как каждый может быть потенциальным противником.
                <span style={badstyle}>
                  &ensp;Вы запомнили кодовые слова, позволяющие распозновать их,
                  когда вы их услышите.
                </span>
              </BlockQuote>
            </Stack.Item>
            <Stack.Divider mr={1} />
            <Stack.Item grow basis={0}>
              <Stack vertical>
                <Stack.Item>Кодовые фразы:</Stack.Item>
                <Stack.Item bold textColor="blue">
                  {phrases}
                </Stack.Item>
                <Stack.Item>Кодовые ответы:</Stack.Item>
                <Stack.Item bold textColor="red">
                  {responses}
                </Stack.Item>
              </Stack>
            </Stack.Item>
          </>
        )}
      </Stack>
    </Section>
  );
};

export const AntagInfoTraitor = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { theme } = data;
  return (
    <Window width={620} height={580} theme={theme}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item grow>
            <Stack fill>
              <Stack.Item width="70%">
                <IntroductionSection />
              </Stack.Item>
              <Stack.Item width="30%">
                <EmployerSection />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Item>
            <UplinkSection />
          </Stack.Item>
          <Stack.Item>
            <CodewordsSection />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
