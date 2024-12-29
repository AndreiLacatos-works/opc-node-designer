import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/hover_tester/AbstractValueOverlapCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

class TransitionValueOverlapCalculator extends AbstractValueOverlapCalculator
    with
        ValueRangeMapper,
        WaveformMinMaxer,
        RangeRestrictorMapper,
        PointTransformer,
        NeighboringTickCalculator {
  double get tolerancePixels => 4.0;

  @override
  WaveFormValueModel<WaveformPointValue>? getOverlappingWaveformValue(
    ScreenSpacePoint position,
    WaveFormModel waveForm,
    DesignerModel designer,
  ) {
    if (designer.designerWidth == 0) {
      return null;
    }

    final mapped = toDriagramSpace(position, waveForm, designer);
    final mappedTolerance = mapValueToNewRange(
      0,
      designer.designerWidth,
      tolerancePixels * designer.sliceRatio,
      0,
      waveForm.duration.toDouble(),
    );

    final points = waveForm.values;
    for (final point in points) {
      if ((point.tick - mapped.dx).abs() <= mappedTolerance) {
        return point;
      }
    }

    return null;
  }
}
