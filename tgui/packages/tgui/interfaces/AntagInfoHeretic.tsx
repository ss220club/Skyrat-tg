import { useBackend, useLocalState } from '../backend';
import { Section, Stack, Box, Tabs, Button, BlockQuote } from '../components';
import { Window } from '../layouts';
import { BooleanLike } from 'common/react';

const hereticRed = {
  color: '#e03c3c',
};

const hereticBlue = {
  fontWeight: 'bold',
  color: '#2185d0',
};

const hereticPurple = {
  fontWeight: 'bold',
  color: '#bd54e0',
};

const hereticGreen = {
  fontWeight: 'bold',
  color: '#20b142',
};

const hereticYellow = {
  fontWeight: 'bold',
  color: 'yellow',
};

type Knowledge = {
  path: string;
  name: string;
  desc: string;
  gainFlavor: string;
  cost: number;
  disabled: boolean;
  hereticPath: string;
  color: string;
};

type KnowledgeInfo = {
  learnableKnowledge: Knowledge[];
  learnedKnowledge: Knowledge[];
};

type Objective = {
  count: number;
  name: string;
  explanation: string;
};

type Info = {
  charges: number;
  total_sacrifices: number;
  ascended: BooleanLike;
  objectives: Objective[];
};

const IntroductionSection = () => {
  return (
    <Stack justify="space-evenly" height="100%" width="100%">
      <Stack.Item grow>
        <Section title="Вы - Еретик!" fill fontSize="14px">
          <Stack vertical>
            <FlavorSection />
            <Stack.Divider />

            <GuideSection />
            <Stack.Divider />

            <InformationSection />
            <Stack.Divider />

            <ObjectivePrintout />
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const FlavorSection = () => {
  return (
    <Stack.Item>
      <Stack vertical textAlign="center" fontSize="14px">
        <Stack.Item>
          <i>
            Еще один день на бессмысленной работе. Вы чувствуете&nbsp;
            <span style={hereticBlue}>мерцание</span>
            &nbsp;вокруг себя, когда что-то&nbsp;
            <span style={hereticRed}>странное</span>
            &nbsp;в воздухе озаряет вас. Вы смотрите внутрь себя и находите то,
            что изменит вашу жизнь.
          </i>
        </Stack.Item>
        <Stack.Item>
          <b>
            <span style={hereticPurple}>Врата Мансуса</span>
            &nbsp;открылись для вашего разума.
          </b>
        </Stack.Item>
      </Stack>
    </Stack.Item>
  );
};

const GuideSection = () => {
  return (
    <Stack.Item>
      <Stack vertical fontSize="12px">
        <Stack.Item>
          - Ищите на станции рушащие реальность&nbsp;
          <span style={hereticPurple}>влияния</span>. Они не видны обычному
          глазу. Нажмите&nbsp;
          <b>правой кнопкой мыши</b> по ним чтобы получить&nbsp;
          <span style={hereticBlue}>очки знаний</span>. После добычи, они вскоре
          становятся видимыми для всех.
        </Stack.Item>
        <Stack.Item>
          - Используйте ваше&nbsp;
          <span style={hereticRed}>живое сердце</span>
          &nbsp;, чтобы найти&nbsp;
          <span style={hereticRed}>цели для жертвоприношения</span>, но будьте
          аккуратны: пульсируя, оно будет издавать звук сердцебиения на коротком
          расстоянии. Эта способность связана с вашим <b>сердцем</b> - если вы
          его потеряете, совершите ритуал, чтобы вернуть её.
        </Stack.Item>
        <Stack.Item>
          - Нарисуйте&nbsp;
          <span style={hereticGreen}>руну трансмутации</span>, используя
          инструмент для рисования (ручка или карандаш) на полу. Необходимо
          иметь&nbsp;
          <span style={hereticGreen}>хватку Мансуса</span>
          &nbsp;в вашей другой руке. Эта руна позволяет совершать ритуалы и
          жертвоприношения.
        </Stack.Item>
        <Stack.Item>
          - Следуйте за зовом <span style={hereticRed}>живого сердца</span>,
          чтобы найти свои цели. Принесите их на&nbsp;
          <span style={hereticGreen}>руну трансмутации</span> в критическом, или
          хуже, состоянии для&nbsp;
          <span style={hereticRed}>жертвоприношения</span>, которое даст&nbsp;
          <span style={hereticBlue}>очки знаний</span>. Мансус примет{' '}
          <b>ТОЛЬКО</b> цели, указанные вашим&nbsp;
          <span style={hereticRed}>живым сердцем</span>.
        </Stack.Item>
        <Stack.Item>
          - Сделайте себе <span style={hereticYellow}>фокус</span>, чтобы читать
          более продвинутые заклинания, которые помогут вам для более сложных
          жертвоприношений.
        </Stack.Item>
        <Stack.Item>
          - Выполните все свои задачи, чтобы узнать{' '}
          <span style={hereticYellow}>финальный ритуал</span>. Завершите его,
          чтобы стать всемогущим!
        </Stack.Item>
      </Stack>
    </Stack.Item>
  );
};

const InformationSection = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { charges, total_sacrifices, ascended } = data;
  return (
    <Stack.Item>
      <Stack vertical fill>
        {!!ascended && (
          <Stack.Item>
            <Stack align="center">
              <Stack.Item>Вы</Stack.Item>
              <Stack.Item fontSize="24px">
                <Box inline color="yellow">
                  ВОЗВЫСИЛИСЬ
                </Box>
                !
              </Stack.Item>
            </Stack>
          </Stack.Item>
        )}
        <Stack.Item>
          Доступно <span style={hereticBlue}>очков знаний</span>:{' '}
          <b>{charges || 0}</b>&nbsp;
        </Stack.Item>
        <Stack.Item>
          Жертвоприношений сделано: <b>{total_sacrifices || 0}</b>
        </Stack.Item>
      </Stack>
    </Stack.Item>
  );
};

const ObjectivePrintout = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { objectives } = data;
  return (
    <Stack.Item>
      <Stack vertical fill>
        <Stack.Item bold>
          Для возвышения вам нужно выполнить следующие задачи:
        </Stack.Item>
        <Stack.Item>
          {(!objectives && 'Пусто!') ||
            objectives.map((objective) => (
              <Stack.Item key={objective.count}>
                {objective.count}: {objective.explanation}
              </Stack.Item>
            ))}
        </Stack.Item>
      </Stack>
    </Stack.Item>
  );
};

const ResearchedKnowledge = (props, context) => {
  const { data } = useBackend<KnowledgeInfo>(context);
  const { learnedKnowledge } = data;

  return (
    <Stack.Item grow>
      <Section title="Изученные знания" fill scrollable>
        <Stack vertical>
          {(!learnedKnowledge.length && 'Пусто!') ||
            learnedKnowledge.map((learned) => (
              <Stack.Item key={learned.name}>
                <Button
                  width="100%"
                  color={learned.color}
                  content={`${learned.hereticPath} - ${learned.name}`}
                  tooltip={learned.desc}
                />
              </Stack.Item>
            ))}
        </Stack>
      </Section>
    </Stack.Item>
  );
};

const KnowledgeShop = (props, context) => {
  const { data, act } = useBackend<KnowledgeInfo>(context);
  const { learnableKnowledge } = data;

  return (
    <Stack.Item grow>
      <Section title="Возможные знания" fill scrollable>
        {(!learnableKnowledge.length && 'Пусто!') ||
          learnableKnowledge.map((toLearn) => (
            <Stack.Item key={toLearn.name} mb={1}>
              <Button
                width="100%"
                color={toLearn.color}
                disabled={toLearn.disabled}
                content={`${toLearn.hereticPath} - ${
                  toLearn.cost > 0
                    ? `${toLearn.name}: ${toLearn.cost}
                  очко${toLearn.cost !== 1 ? 'в' : ''}`
                    : toLearn.name
                }`}
                tooltip={toLearn.desc}
                onClick={() => act('research', { path: toLearn.path })}
              />
              {!!toLearn.gainFlavor && (
                <BlockQuote>
                  <i>{toLearn.gainFlavor}</i>
                </BlockQuote>
              )}
            </Stack.Item>
          ))}
      </Section>
    </Stack.Item>
  );
};

const ResearchInfo = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { charges } = data;

  return (
    <Stack justify="space-evenly" height="100%" width="100%">
      <Stack.Item grow>
        <Stack vertical height="100%">
          <Stack.Item fontSize="20px" textAlign="center">
            Доступные <span style={hereticBlue}>очки знаний</span> :{' '}
            <b>{charges || 0}</b>&nbsp;.
          </Stack.Item>
          <Stack.Item grow>
            <Stack height="100%">
              <ResearchedKnowledge />
              <KnowledgeShop />
            </Stack>
          </Stack.Item>
        </Stack>
      </Stack.Item>
    </Stack>
  );
};

export const AntagInfoHeretic = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { ascended } = data;

  const [currentTab, setTab] = useLocalState(context, 'currentTab', 0);

  return (
    <Window width={675} height={625}>
      <Window.Content
        style={{
          // 'font-family': 'Times New Roman',
          // 'fontSize': '20px',
          'background-image': 'none',
          'background': ascended
            ? 'radial-gradient(circle, rgba(24,9,9,1) 54%, rgba(31,10,10,1) 60%, rgba(46,11,11,1) 80%, rgba(47,14,14,1) 100%);'
            : 'radial-gradient(circle, rgba(9,9,24,1) 54%, rgba(10,10,31,1) 60%, rgba(21,11,46,1) 80%, rgba(24,14,47,1) 100%);',
        }}>
        <Stack vertical fill>
          <Stack.Item>
            <Tabs fluid>
              <Tabs.Tab
                icon="info"
                selected={currentTab === 0}
                onClick={() => setTab(0)}>
                Информация
              </Tabs.Tab>
              <Tabs.Tab
                icon={currentTab === 1 ? 'book-open' : 'book'}
                selected={currentTab === 1}
                onClick={() => setTab(1)}>
                Исследования
              </Tabs.Tab>
            </Tabs>
          </Stack.Item>
          <Stack.Item grow>
            {(currentTab === 0 && <IntroductionSection />) || <ResearchInfo />}
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
