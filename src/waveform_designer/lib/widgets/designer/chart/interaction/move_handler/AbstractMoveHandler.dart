import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';

abstract class AbstractMoveHandler {
  void handleMove(
    WaveFormValueModel value,
    ScreenSpacePoint newPosition,
    WidgetRef ref,
  );
}
