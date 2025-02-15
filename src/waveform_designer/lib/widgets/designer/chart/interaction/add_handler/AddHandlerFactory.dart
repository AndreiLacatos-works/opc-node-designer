import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/add_handler/AbstractValueAddHandler.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/add_handler/NullAddHandler.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/add_handler/NumericValueAddHandler.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/add_handler/TransitionValueAddHandler.dart';

class AddHandlerFactory {
  static AbstractValueAddHandler getAddHandler(WaveFormModel waveform) {
    return switch (waveform.type) {
      Void => NullAddHandler(),
      Transition => TransitionValueAddHandler(),
      DoubleValue => NumericValueAddHandler(),
      _ => throw "${waveform.type} has no add handler",
    };
  }
}
