import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

mixin NeighboringTickCalculator on ValueRangeMapper {
  double diagramWidth = 0;
  late WaveFormModel waveForm;
  late DesignerModel designer;

  int getNeighboringTick(double position) {
    // map the screen space value to duration space
    final durationSpacePosition = mapValueToNewRange(
      0,
      diagramWidth,
      compensateZoomLevel(position),
      0,
      waveForm.duration.toDouble(),
    ).toInt();

    // determine the closest tick
    final tickCount = waveForm.duration ~/ waveForm.tickFrequency + 1;
    final ticks =
        List.generate(tickCount, (i) => i * waveForm.tickFrequency).toList();
    return ticks.reduce((a, b) =>
        (a - durationSpacePosition).abs() < (b - durationSpacePosition).abs()
            ? a
            : b);
  }

  double compensateZoomLevel(double position) {
    // map the input position from zoomed screen space
    // to simple screen space values to account for zooming
    return mapValueToNewRange(
      0,
      designer.designerWidth,
      position,
      designer.designerWidth * designer.sliceOffset,
      designer.designerWidth * designer.sliceOffset +
          designer.designerWidth * designer.sliceRatio,
    );
  }
}
