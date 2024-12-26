import 'package:waveform_designer/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/calc/ScreenSpacePoint.dart';

mixin TickOverlapCalculator on NeighboringTickCalculator {
  int? getOverlappingTransitionPointIndex(ScreenSpacePoint position) {
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

    for (var i = 0; i < waveForm.transitionPoints.length; i++) {
      final point = waveForm.transitionPoints[i];
      if ((point - mapped.dx).abs() <= mappedTolerance) {
        return i;
      }
    }

    return null;
  }
}
