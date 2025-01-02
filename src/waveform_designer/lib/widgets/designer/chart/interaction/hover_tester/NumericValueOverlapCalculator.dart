import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/hover_tester/TransitionValueOverlapCalculator.dart';

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

    // in case the min and max are the same, points are drawn in the middle of the canvas
    if (waveformMinValue == waveformMaxValue) {
      return (designer.designerHeight / 2 - position.dy).abs() <=
              tolerancePixels
          ? overlapByTick
          : null;
    }

    final fullValueRange = (waveformMinValue - waveformMaxValue).abs();
    final toleranceDistance =
        fullValueRange / designer.designerHeight * tolerancePixels;

    return ((overlapByTick.value.getValue() - mapped.dy).abs() <=
            toleranceDistance)
        ? overlapByTick
        : null;
  }
}
