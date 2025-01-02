import 'package:opc_node_designer/widgets/designer/chart/calc/DiagramSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

mixin PointTransformer
    on ValueRangeMapper, WaveformMinMaxer, RangeRestrictorMapper {
  DiagramSpacePoint toDriagramSpace(
    ScreenSpacePoint position,
    WaveFormModel waveForm,
    DesignerModel designer,
  ) {
    // converts a screen-space coordinate (e.g., the pixel under the pointer)
    // to a diagram-space coordinate (e.g., a millisecond value). Essentially,
    // it maps the pointer's pixel position to its corresponding millisecond
    // value in the diagram. Adjustments are applied to account for zoom level
    // and panning offset. For example, with an input dx = 0.0, a zoom level of
    // 0.5 (showing only half the diagram), and a pan offset of 0.1, the output
    // may not directly correspond to 0.0 in the diagram. This is because, at
    // screen position 0.0, the panning offset ensures that the diagram's 0.0
    // is no longer aligned with the screen's 0.0)
    final [waveformMinValue, waveformMaxValue] =
        getWaveformMinMaxValues(waveForm.values);
    final fullRange = (waveformMaxValue - waveformMinValue).abs();
    final factor = ((1 - availableAreaRatio) / 2);
    final delta = fullRange * factor;
    final newMax = waveformMaxValue + delta;
    final newMin = waveformMinValue - delta;
    return DiagramSpacePoint(
      dx: mapValueToNewRange(
        0,
        designer.designerWidth,
        _compensateZoomLevel(position.dx, designer),
        0,
        waveForm.duration.toDouble(),
      ).toInt(),
      dy: mapValueToNewRange(
        0,
        designer.designerHeight,
        position.dy,
        newMax,
        newMin,
      ),
    );
  }

  double _compensateZoomLevel(
    double position,
    DesignerModel designer,
  ) {
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
