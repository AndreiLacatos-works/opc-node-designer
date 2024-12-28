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

    final transitionPoints = waveForm.values.map((v) => v.tick).toList();
    for (var i = 0; i < transitionPoints.length; i++) {
      final point = transitionPoints[i];
      if ((point - mapped.dx).abs() <= mappedTolerance) {
        return i;
      }
    }

    return null;
  }
}
