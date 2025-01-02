import 'dart:ui';

import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';

mixin VerticalOffsetCalculator
    on WaveformMinMaxer, RangeRestrictorMapper, PointTransformer {
  double getVerticalOffset(
    List<WaveFormValueModel> values,
    WaveFormValueModel value,
    Size canvasSize,
  ) {
    final [minValue, maxValue] = getWaveformMinMaxValues(values);

    // in case the min and max values are the same, draw the points in the
    // middle of the canvas instead of the top (mapping yields 0 in this case)
    if (minValue == maxValue) {
      return canvasSize.height / 2;
    }

    final verticalOffset = mapValueToRestrictedRange(
      maxValue,
      minValue,
      value.value.getValue(),
      canvasSize.height,
      canvasSize.height,
    );
    return verticalOffset;
  }

  double getNewValue(
    WaveFormModel waveForm,
    DesignerModel designer,
    ScreenSpacePoint newPosition,
  ) {
    final [minValue, maxValue] = getWaveformMinMaxValues(waveForm.values);
    return minValue == maxValue
        ? minValue + (designer.designerHeight / 2) - newPosition.dy
        : toDriagramSpace(newPosition, waveForm, designer).dy;
  }
}
