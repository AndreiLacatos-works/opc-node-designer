import 'package:waveform_designer/calc/NeighboringTickCalculator.dart';

mixin TickOverlapCalculator on NeighboringTickCalculator {
  int? getOverlappingTransitionPointIndex(double position) {
    double tolerancePixels = 6.0;

    if (diagramWidth == 0) {
      return null;
    }

    final mapped = mapValueToNewRange(
        0, diagramWidth, position, 0, waveForm.duration.toDouble());
    final mappedTolerance = mapValueToNewRange(
        0, diagramWidth, tolerancePixels, 0, waveForm.duration.toDouble());

    for (var i = 0; i < waveForm.transitionPoints.length; i++) {
      final point = waveForm.transitionPoints[i];
      if ((point - mapped).abs() <= mappedTolerance) {
        return i;
      }
    }

    return null;
  }
}
