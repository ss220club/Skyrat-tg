import { BooleanLike, classes } from 'common/react';
import { Component } from 'inferno';
import { Section, Stack, Box, Button, Flex, Tooltip, NoticeBox, Dimmer, Icon } from '../../components';
import { calculateProgression, getReputation, Rank } from './calculateReputationLevel';
import { ObjectiveState } from './constants';

export type Objective = {
  id: number;
  name: string;
  description: string;
  progression_minimum: number;
  progression_reward: number;
  telecrystal_reward: number;
  telecrystal_penalty: number;
  ui_buttons?: ObjectiveUiButton[];
  objective_state: ObjectiveState;
  original_progression: number;
  final_objective: BooleanLike;
};

export type ObjectiveUiButton = {
  name: string;
  tooltip: string;
  icon: string;
  action: string;
};

type ObjectiveMenuProps = {
  activeObjectives: Objective[];
  potentialObjectives: Objective[];
  maximumActiveObjectives: number;
  maximumPotentialObjectives: number;

  handleStartObjective: (objective: Objective) => void;
  handleObjectiveAction: (objective: Objective, action: string) => void;
  handleObjectiveCompleted: (objective: Objective) => void;
  handleObjectiveAbort: (objective: Objective) => void;
  handleRequestObjectives: () => void;
};

type ObjectiveMenuState = {
  draggingObjective: Objective | null;
  objectiveX: number;
  objectiveY: number;
};

let dragClickTimer = 0;

export class ObjectiveMenu extends Component<
  ObjectiveMenuProps,
  ObjectiveMenuState
> {
  constructor() {
    super();
    this.state = {
      draggingObjective: null,
      objectiveX: 0,
      objectiveY: 0,
    };

    this.handleObjectiveClick = this.handleObjectiveClick.bind(this);
    this.handleMouseUp = this.handleMouseUp.bind(this);
    this.handleMouseMove = this.handleMouseMove.bind(this);
    this.handleObjectiveAdded = this.handleObjectiveAdded.bind(this);
  }

  handleObjectiveClick(event: MouseEvent, objective: Objective) {
    if (this.state?.draggingObjective) {
      return;
    }
    if (event.button === 0) {
      // Left click
      this.setState({
        draggingObjective: objective,
        objectiveX: event.clientX,
        objectiveY: event.clientY,
      });
      window.addEventListener('mouseup', this.handleMouseUp);
      window.addEventListener('mousemove', this.handleMouseMove);
      event.stopPropagation();
      event.preventDefault();

      dragClickTimer = Date.now() + 100; // 100 milliseconds
    }
  }

  handleMouseUp(event: MouseEvent) {
    if (dragClickTimer > Date.now()) {
      return;
    }

    window.removeEventListener('mouseup', this.handleMouseUp);
    window.removeEventListener('mousemove', this.handleMouseMove);
    this.setState({
      draggingObjective: null,
    });
  }

  handleMouseMove(event: MouseEvent) {
    this.setState({
      objectiveX: event.pageX,
      objectiveY: event.pageY - 32,
    });
  }

  handleObjectiveAdded(event: MouseEvent) {
    const { draggingObjective } = this.state as ObjectiveMenuState;
    if (!draggingObjective) {
      return;
    }
    const { handleStartObjective } = this.props;
    handleStartObjective(draggingObjective);
  }

  render() {
    const {
      activeObjectives = [],
      potentialObjectives,
      maximumActiveObjectives,
      maximumPotentialObjectives,
      handleObjectiveAction,
      handleObjectiveCompleted,
      handleObjectiveAbort,
      handleRequestObjectives,
    } = this.props;
    const { draggingObjective, objectiveX, objectiveY } = this
      .state as ObjectiveMenuState;

    potentialObjectives.sort((objA, objB) => {
      if (objA.progression_minimum < objB.progression_minimum) {
        return 1;
      } else if (objA.progression_minimum > objB.progression_minimum) {
        return -1;
      }
      return 0;
    });
    return (
      <>
        <Stack vertical fill scrollable>
          <Stack.Item>
            <Section>
              <Stack>
                {Array.apply(null, Array(maximumActiveObjectives)).map(
                  (_, index) => {
                    if (index >= activeObjectives.length) {
                      return (
                        <Stack.Item key={index} minHeight="100px" grow>
                          <Box
                            color="label"
                            className="UplinkObjective__EmptyObjective"
                            onMouseUp={this.handleObjectiveAdded}>
                            <Stack textAlign="center" fill align="center">
                              <Stack.Item textAlign="center" width="100%">
                                Нет задачи, перенесите сюда новую, чтобы принять
                                её
                              </Stack.Item>
                            </Stack>
                          </Box>
                        </Stack.Item>
                      );
                    }
                    const objective = activeObjectives[index];
                    return (
                      <Stack.Item key={index} grow>
                        {ObjectiveFunction(
                          objective,
                          true,
                          handleObjectiveAction,
                          handleObjectiveCompleted,
                          handleObjectiveAbort,
                          true
                        )}
                      </Stack.Item>
                    );
                  }
                )}
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <Section
              title="Возможные задачи"
              textAlign="center"
              fill
              scrollable>
              <Flex wrap="wrap" justify="space-evenly">
                {potentialObjectives.map((objective) => {
                  return (
                    <Flex.Item
                      key={objective.id}
                      textAlign="left"
                      basis="49%"
                      mb={1}
                      mx="0.5%"
                      onMouseDown={(event) => {
                        this.handleObjectiveClick(event, objective);
                      }}>
                      {(objective.id !== draggingObjective?.id &&
                        ObjectiveFunction(
                          objective,
                          false,
                          undefined,
                          undefined,
                          undefined,
                          true
                        )) || (
                        <Box
                          style={{
                            'border': '2px dashed black',
                          }}
                          width="100%"
                          height="100%"
                          minHeight="100px"
                        />
                      )}
                    </Flex.Item>
                  );
                })}
                {(maximumPotentialObjectives === 0 && (
                  <Dimmer>
                    <Icon name="lock" color="red" fontSize={8} mb={2} />
                    <Box color="red" fontSize={3}>
                      Выбор задач заблокирован
                    </Box>
                  </Dimmer>
                )) ||
                  (potentialObjectives.length < maximumPotentialObjectives && (
                    <Flex.Item
                      basis="100%"
                      style={
                        {
                          // "background-color": "rgba(0, 0, 0, 0.5)",
                        }
                      }
                      mb={1}
                      mx="0.5%"
                      minHeight="100px">
                      <Stack
                        align="center"
                        height="100%"
                        width="100%"
                        textAlign="center">
                        <Stack.Item width="100%">
                          <Button
                            content="Запросить больше задач"
                            fontSize={2}
                            onClick={handleRequestObjectives}
                          />
                        </Stack.Item>
                      </Stack>
                    </Flex.Item>
                  ))}
              </Flex>
            </Section>
          </Stack.Item>
        </Stack>
        {!!draggingObjective && (
          <Box
            width="360px"
            height="200px"
            position="absolute"
            left={`${objectiveX - 180}px`}
            top={`${objectiveY}px`}
            style={{
              'pointer-events': 'none',
            }}>
            {ObjectiveFunction(draggingObjective, false)}
          </Box>
        )}
      </>
    );
  }
}

const ObjectiveFunction = (
  objective: Objective,
  active: boolean,
  handleObjectiveAction?: (objective: Objective, action: string) => void,
  handleCompletion?: (objective: Objective) => void,
  handleAbort?: (objective: Objective) => void,
  grow: boolean = false
) => {
  const reputation = getReputation(objective.progression_minimum);
  return (
    <ObjectiveElement
      name={objective.name}
      description={objective.description}
      reputation={reputation}
      telecrystalReward={objective.telecrystal_reward}
      telecrystalPenalty={objective.telecrystal_penalty}
      progressionReward={objective.progression_reward}
      objectiveState={objective.objective_state}
      originalProgression={objective.original_progression}
      hideTcRep={objective.final_objective}
      finalObjective={objective.final_objective}
      canAbort={
        !!handleAbort &&
        !objective.final_objective &&
        objective.objective_state === ObjectiveState.Active
      }
      grow={grow}
      handleCompletion={(event) => {
        if (handleCompletion) {
          handleCompletion(objective);
        }
      }}
      handleAbort={(event) => {
        if (handleAbort) {
          handleAbort(objective);
        }
      }}
      uiButtons={
        active && handleObjectiveAction ? (
          <Stack width="100%" justify="center">
            {objective.ui_buttons?.map((value, index) => (
              <Stack.Item key={index}>
                <Button
                  content={value.name}
                  icon={value.icon}
                  tooltip={value.tooltip}
                  className={reputation.gradient}
                  onClick={() => {
                    handleObjectiveAction(objective, value.action);
                  }}
                />
              </Stack.Item>
            ))}
          </Stack>
        ) : undefined
      }
    />
  );
};

type ObjectiveElementProps = {
  name: string;
  reputation: Rank;
  description: string;
  telecrystalReward: number;
  progressionReward: number;
  uiButtons?: JSX.Element;
  objectiveState?: ObjectiveState;
  originalProgression: number;
  telecrystalPenalty: number;
  grow: boolean;
  hideTcRep: BooleanLike;
  finalObjective: BooleanLike;
  canAbort: BooleanLike;

  handleCompletion?: (event: MouseEvent) => void;
  handleAbort?: (event: MouseEvent) => void;
};

export const ObjectiveElement = (props: ObjectiveElementProps, context) => {
  const {
    name,
    reputation,
    description,
    uiButtons = null,
    telecrystalReward,
    progressionReward,
    objectiveState,
    telecrystalPenalty,
    handleCompletion,
    handleAbort,
    canAbort,
    originalProgression,
    hideTcRep,
    grow,
    finalObjective,
    ...rest
  } = props;

  const objectiveFinished =
    objectiveState === ObjectiveState.Completed ||
    objectiveState === ObjectiveState.Failed ||
    objectiveState === ObjectiveState.Invalid;

  const objectiveFailed = objectiveState !== ObjectiveState.Completed;
  let objectiveCompletionText;
  switch (objectiveState) {
    case ObjectiveState.Invalid:
      objectiveCompletionText = 'Недействительна';
      break;
    case ObjectiveState.Completed:
      objectiveCompletionText = 'Завершена';
      break;
    case ObjectiveState.Failed:
      objectiveCompletionText = 'Провалена';
      break;
  }

  const progressionDiff =
    Math.round((1 - progressionReward / originalProgression) * 1000) / 10;

  return (
    <Flex height={grow ? '100%' : undefined} direction="column">
      <Flex.Item grow={grow} basis="content">
        <Box
          className={classes([
            'UplinkObjective__Titlebar',
            reputation.gradient,
          ])}
          width="100%"
          height="100%">
          <Stack>
            <Stack.Item grow={1}>
              {name}{' '}
              {!objectiveFinished ? null : `- ${objectiveCompletionText}`}
            </Stack.Item>
            {canAbort && (
              <Stack.Item>
                <Button
                  icon="trash"
                  color="transparent"
                  tooltip="Отменить задачу"
                  onClick={handleAbort}
                />
              </Stack.Item>
            )}
          </Stack>
        </Box>
      </Flex.Item>
      <Flex.Item grow={grow} basis="content">
        <Box className="UplinkObjective__Content" height="100%">
          <Box>{description}</Box>
          {!hideTcRep && (
            <Box mt={1}>
              В случае провала этой задачи, штраф {telecrystalPenalty} TC.
            </Box>
          )}
          {finalObjective && objectiveState === ObjectiveState.Inactive && (
            <NoticeBox warning mt={1}>
              Принятие этой задачи заблокирует возможность брать новые задачи!
              Также, вы не сможете отменить это задание.
            </NoticeBox>
          )}
        </Box>
      </Flex.Item>
      <Flex.Item>
        <Box className="UplinkObjective__Footer">
          <Stack vertical>
            {!hideTcRep && (
              <Stack.Item>
                <Stack align="center" justify="center">
                  <Box
                    style={{
                      'border': '2px solid rgba(0, 0, 0, 0.5)',
                      'border-left': 'none',
                      'border-right': 'none',
                      'border-bottom': objectiveFinished ? 'none' : undefined,
                    }}
                    className={reputation.gradient}
                    py={0.5}
                    width="100%"
                    textAlign="center">
                    {telecrystalReward} TC,
                    <Box ml={1} as="span">
                      {calculateProgression(progressionReward)} репутации
                      {Math.abs(progressionDiff) > 10 && (
                        <Tooltip
                          content={
                            <Box>
                              Вы получите
                              <Box
                                mr={1}
                                ml={1}
                                color={
                                  progressionDiff > 0
                                    ? progressionDiff > 25
                                      ? 'red'
                                      : 'orange'
                                    : 'green'
                                }
                                as="span">
                                {Math.abs(progressionDiff)}%
                              </Box>
                              {progressionDiff > 0 ? 'меньше' : 'больше'}{' '}
                              репутации from this objective. This is because
                              your reputation is от этой задачи, так как ваша
                              репутация{' '}
                              {progressionDiff > 0
                                ? 'обгоняет '
                                : 'не догоняет '}
                              ту, на которой вы должны быть.
                            </Box>
                          }>
                          <Box
                            ml={1}
                            color={
                              progressionDiff > 0
                                ? progressionDiff > 35
                                  ? 'red'
                                  : 'orange'
                                : 'green'
                            }
                            as="span">
                            ({progressionDiff > 0 ? '-' : '+'}
                            {Math.abs(progressionDiff)}%)
                          </Box>
                        </Tooltip>
                      )}
                    </Box>
                  </Box>
                </Stack>
                {objectiveFinished ? (
                  <Box
                    inline
                    className={reputation.gradient}
                    style={{
                      'border-radius': '0',
                      'border': '2px solid rgba(0, 0, 0, 0.5)',
                      'border-left': 'none',
                      'border-right': 'none',
                    }}
                    position="relative"
                    width="100%"
                    textAlign="center"
                    bold>
                    <Box
                      width="100%"
                      height="100%"
                      backgroundColor={
                        objectiveFailed
                          ? 'rgba(255, 0, 0, 0.1)'
                          : 'rgba(0, 255, 0, 0.1)'
                      }
                      position="absolute"
                      left={0}
                      top={0}
                    />
                    <Button
                      onClick={handleCompletion}
                      color={objectiveFailed ? 'bad' : 'good'}
                      style={{
                        'border': '1px solid rgba(0, 0, 0, 0.65)',
                      }}
                      my={1}>
                      ВЫПОЛНИТЬ
                    </Button>
                  </Box>
                ) : null}
              </Stack.Item>
            )}
            {!!uiButtons && !objectiveFinished && (
              <Stack.Item>{uiButtons}</Stack.Item>
            )}
          </Stack>
        </Box>
      </Flex.Item>
    </Flex>
  );
};
