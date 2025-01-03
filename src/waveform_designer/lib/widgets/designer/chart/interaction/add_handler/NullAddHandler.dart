import 'package:flutter_riverpod/src/consumer.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/add_handler/AbstractValueAddHandler.dart';

class NullAddHandler extends AbstractValueAddHandler {
  @override
  void addValue(
    int tick,
    WaveformPointValue value,
    WidgetRef ref,
  ) {
    return;
  }

  @override
  void addValueAtDesiredPosition(
    ScreenSpacePoint desiredPosition,
    WidgetRef ref,
  ) {
    return;
  }
}
