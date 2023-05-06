import { Feature, FeatureNumberInput } from '../../base';

export const sound_tts_local: Feature<number> = {
  name: 'Local TTS loundess (0 to disable)',
  category: 'SOUND',
  component: FeatureNumberInput,
};

export const sound_tts_radio: Feature<number> = {
  name: 'Radio TTS loudness (0 to disable)',
  category: 'SOUND',
  component: FeatureNumberInput,
};
