import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/hover_tester/TransitionValueOverlapCalculator.dart';

class NumericValueOverlapCalculator extends TransitionValueOverlapCalculator {
  @override
  WaveFormValueModel<WaveformPointValue>? getOverlappingWaveformValue(
    ScreenSpacePoint position,
    WaveFormModel waveForm,
    DesignerModel designer,
  ) {
    // first check if any value overlaps by the tick (a.k.a. horizontally),
    // after that check if the match overlaps by the value as well
    // (a.k.a. vertically)
    final overlapByTick = super.getOverlappingWaveformValue(
      position,
      waveForm,
      designer,
    );
    if (overlapByTick == null) {
      return null;
    }

    final mapped = toDriagramSpace(position, waveForm, designer);
    final [waveformMinValue, waveformMaxValue] =
        getWaveformMinMaxValues(waveForm.values);

    final fullValueRange = (waveformMinValue - waveformMaxValue).abs();
    final toleranceDistance =
        fullValueRange / designer.designerHeight * tolerancePixels;

    return ((overlapByTick.value.getValue() - mapped.dy).abs() <=
            toleranceDistance)
        ? overlapByTick
        : null;
  }
}
