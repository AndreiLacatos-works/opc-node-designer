import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/move_preview_painters/SnapPainter.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/move_preview_painters/ValueMovePainter.dart';

mixin MovePreviewPainterProvider {
  List<CustomPainter> providePainters(
    WaveFormModel waveform,
    DesignerModel panning,
    Offset? desiredPosition,
  ) {
    return switch (waveform.type) {
      Transition => [
          SnapPainter(
            waveform: waveform,
            panning: panning,
            point: desiredPosition != null
                ? ScreenSpacePoint.fromOffset(desiredPosition)
                : null,
          ),
        ],
      DoubleValue => [
          SnapPainter(
            waveform: waveform,
            panning: panning,
            point: desiredPosition != null
                ? ScreenSpacePoint.fromOffset(desiredPosition)
                : null,
          ),
          ValueMovePainter(
            waveform: waveform,
            panning: panning,
            point: desiredPosition != null
                ? ScreenSpacePoint.fromOffset(desiredPosition)
                : null,
          ),
        ],
      _ => [],
    };
  }
}
