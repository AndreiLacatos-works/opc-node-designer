import 'package:opc_node_designer/state/designer/designer.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/hover_tester/AbstractValueOverlapCalculator.dart';

class NullOverlapCalculator extends AbstractValueOverlapCalculator {
  @override
  WaveFormValueModel<WaveformPointValue>? getOverlappingWaveformValue(
    ScreenSpacePoint position,
    WaveFormModel<WaveformPointValue> waveForm,
    DesignerModel designer,
  ) {
    return null;
  }
}
