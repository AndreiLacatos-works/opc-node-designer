import 'package:waveform_designer/calc/DiagramSpacePoint.dart';
import 'package:waveform_designer/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

mixin PointTransformer on ValueRangeMapper {
  late WaveFormModel waveForm;
  late DesignerModel designer;

  DiagramSpacePoint toDriagramSpace(ScreenSpacePoint position) {
    // converts a screen-space coordinate (e.g., the pixel under the pointer)
    // to a diagram-space coordinate (e.g., a millisecond value). Essentially,
    // it maps the pointer's pixel position to its corresponding millisecond
    // value in the diagram. Adjustments are applied to account for zoom level
    // and panning offset. For example, with an input dx = 0.0, a zoom level of
    // 0.5 (showing only half the diagram), and a pan offset of 0.1, the output
    // may not directly correspond to 0.0 in the diagram. This is because, at
    // screen position 0.0, the panning offset ensures that the diagram's 0.0
    // is no longer aligned with the screen's 0.0)
    return DiagramSpacePoint(
      dx: mapValueToNewRange(
        0,
        designer.designerWidth,
        _compensateZoomLevel(position.dx),
        0,
        waveForm.duration.toDouble(),
      ).toInt(),
    );
  }

  double _compensateZoomLevel(double position) {
    // map the input position from zoomed screen space
    // to simple screen space values to account for zooming
    return mapValueToNewRange(
      0,
      designer.designerWidth,
      position,
      designer.designerWidth * designer.sliceOffset,
      designer.designerWidth * (designer.sliceOffset + designer.sliceRatio),
    );
  }
}
