import { Feature, FeatureValueProps, FeatureNumericData } from '../../base';
import { Box, Slider } from '../../../../../../components';

const SLIDER_STEP_SIZE_FOR_SETTINGS_WINDOW_WIDTH = 4.1;

const FeatureSlider = (
  props: FeatureValueProps<number, number, FeatureNumericData>
) => {
  if (!props.serverData) {
    return <Box>Loading...</Box>;
  }

  return (
    <Slider
      stepPixelSize={SLIDER_STEP_SIZE_FOR_SETTINGS_WINDOW_WIDTH}
      onChange={(e, value) => {
        props.handleSetValue(value);
      }}
      minValue={props.serverData.minimum}
      maxValue={props.serverData.maximum}
      step={props.serverData.step}
      value={props.value}
    />
  );
};

export const sound_tts_local: Feature<number> = {
  name: 'Local TTS volume (0 to disable)',
  category: 'SOUND',
  component: FeatureSlider,
};

export const sound_tts_radio: Feature<number> = {
  name: 'Radio TTS volume (0 to disable)',
  category: 'SOUND',
  component: FeatureSlider,
};
