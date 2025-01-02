import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';

abstract class AbstractValueAddHandler {
  void addValueAtDesiredPosition(
    ScreenSpacePoint desiredPosition,
    WidgetRef ref,
  );

  void addValue(
    int tick,
    WaveformPointValue value,
    WidgetRef ref,
  );
}
