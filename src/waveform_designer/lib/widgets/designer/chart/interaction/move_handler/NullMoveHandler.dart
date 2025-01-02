import 'package:flutter_riverpod/src/consumer.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/move_handler/AbstractMoveHandler.dart';

class NullMoveHandler extends AbstractMoveHandler {
  @override
  void handleMove(
    WaveFormValueModel<WaveformPointValue> value,
    ScreenSpacePoint newPosition,
    WidgetRef ref,
  ) {
    return;
  }
}
