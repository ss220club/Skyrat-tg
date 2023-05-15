import { exhaustiveCheck } from 'common/exhaustive';
import { useBackend, useLocalState } from '../../backend';
import { Stack, Dropdown, Flex } from '../../components';
import { Window } from '../../layouts';
import { PreferencesMenuData } from './data';
import { PageButton } from './PageButton';
import { AntagsPage } from './AntagsPage';
import { JobsPage } from './JobsPage';
import { MainPage } from './MainPage';
import { SpeciesPage } from './SpeciesPage';
import { QuirksPage } from './QuirksPage';
// SKYRAT EDIT
import { LanguagesPage } from './LanguagesMenu';
import { LimbsPage } from './LimbsPage';
// SKYRAT EDIT END
import { VoicePage } from './VoicePage';
enum Page {
  Antags,
  Main,
  Jobs,
  // SKYRAT EDIT
  Limbs,
  Languages,
  // SKYRAT EDIT END
  Species,
  Quirks,
  Voice,
}

const CharacterProfiles = (props: {
  activeSlot: number; // SKYRAT EDIT CHANGE
  onClick: (index: number) => void;
  profiles: (string | null)[];
}) => {
  const { profiles, activeSlot, onClick } = props;
  // SKYRAT EDIT CHANGE
  return (
    <Flex align="center" justify="center">
      <Flex.Item width="25%">
        <Dropdown
          width="100%"
          selected={activeSlot}
          displayText={profiles[activeSlot]}
          options={profiles.map((profile, slot) => ({
            value: slot,
            displayText: profile ?? 'Новый персонаж',
          }))}
          onSelected={(slot) => {
            onClick(slot);
          }}
        />
      </Flex.Item>
    </Flex>
  );
};

export const CharacterPreferenceWindow = (props, context) => {
  const { act, data } = useBackend<PreferencesMenuData>(context);

  const [currentPage, setCurrentPage] = useLocalState(
    context,
    'currentPage',
    Page.Main
  );

  let pageContents;

  switch (currentPage) {
    case Page.Antags:
      pageContents = <AntagsPage />;
      break;
    case Page.Jobs:
      pageContents = <JobsPage />;
      break;
    // SKYRAT EDIT
    case Page.Limbs:
      pageContents = <LimbsPage />;
      break;
    case Page.Languages:
      pageContents = <LanguagesPage />;
      break;
    // SKYRAT EDIT END
    case Page.Main:
      pageContents = (
        <MainPage openSpecies={() => setCurrentPage(Page.Species)} />
      );

      break;
    case Page.Species:
      pageContents = (
        <SpeciesPage closeSpecies={() => setCurrentPage(Page.Main)} />
      );

      break;
    case Page.Quirks:
      pageContents = <QuirksPage />;
      break;
    case Page.Voice:
      pageContents = <VoicePage />;
      break;
    default:
      exhaustiveCheck(currentPage);
  }

  return (
    <Window title="Настройки персонажа" width={920} height={770}>
      <Window.Content scrollable>
        <Stack vertical fill>
          <Stack.Item>
            <CharacterProfiles
              activeSlot={data.active_slot - 1}
              onClick={(slot) => {
                act('change_slot', {
                  slot: slot + 1,
                });
              }}
              profiles={data.character_profiles}
            />
          </Stack.Item>

          {!data.content_unlocked && (
            <Stack.Item align="center">
              Купите BYOND premium для увеличения слотов!
            </Stack.Item>
          )}

          <Stack.Divider />

          <Stack.Item>
            <Stack fill>
              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={Page.Main}
                  setPage={setCurrentPage}
                  otherActivePages={[Page.Species]}>
                  Персонаж
                </PageButton>
              </Stack.Item>

              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={Page.Jobs}
                  setPage={setCurrentPage}>
                  {/*
                    Fun fact: This isn't "Jobs" so that it intentionally
                    catches your eyes, because it's really important!
                  */}
                  Профессии
                </PageButton>
              </Stack.Item>
              {
                // SKYRAT EDIT
              }
              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={Page.Limbs}
                  setPage={setCurrentPage}>
                  Аугментации
                </PageButton>
              </Stack.Item>

              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={Page.Languages}
                  setPage={setCurrentPage}>
                  Языки
                </PageButton>
              </Stack.Item>
              {
                // SKYRAT EDIT END
              }
              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={Page.Antags}
                  setPage={setCurrentPage}>
                  Антагонисты
                </PageButton>
              </Stack.Item>

              <Stack.Item grow>
                <PageButton
                  currentPage={currentPage}
                  page={Page.Quirks}
                  setPage={setCurrentPage}>
                  Черты
                </PageButton>
              </Stack.Item>

              {Boolean(data.tts_enabled) && (
                <Stack.Item grow>
                  <PageButton
                    currentPage={currentPage}
                    page={Page.Voice}
                    setPage={setCurrentPage}>
                    Голос
                  </PageButton>
                </Stack.Item>
              )}
            </Stack>
          </Stack.Item>

          <Stack.Divider />

          <Stack.Item>{pageContents}</Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
