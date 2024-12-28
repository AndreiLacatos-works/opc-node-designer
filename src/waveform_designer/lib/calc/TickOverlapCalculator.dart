import 'package:waveform_designer/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

mixin TickOverlapCalculator on NeighboringTickCalculator {
  WaveFormValueModel? getOverlappingTransitionPointIndex(
      ScreenSpacePoint position) {
    double tolerancePixels = 4.0 * designer.sliceRatio;

    if (designer.designerWidth == 0) {
      return null;
    }

    final mapped = toDriagramSpace(position);
    final mappedTolerance = mapValueToNewRange(
      0,
      designer.designerWidth,
      tolerancePixels,
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
