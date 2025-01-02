import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opc_node_designer/calc/ValueRangeMapper.dart';
import 'package:opc_node_designer/state/designer/designer.state.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart';
import 'package:opc_node_designer/state/waveform/waveform.state.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/VerticalOffsetCalculator.dart';
import 'package:opc_node_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:opc_node_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';
import 'package:opc_node_designer/widgets/designer/chart/interaction/add_handler/AbstractValueAddHandler.dart';

class NumericValueAddHandler extends AbstractValueAddHandler
    with
        ValueRangeMapper,
        RangeRestrictorMapper,
        WaveformMinMaxer,
        PointTransformer,
        NeighboringTickCalculator,
        VerticalOffsetCalculator {
  @override
  void addValueAtDesiredPosition(
    ScreenSpacePoint desiredPosition,
    WidgetRef ref,
  ) {
    final waveform = ref.read(waveFormStateProvider);
    final designer = ref.read(designerStateProvider);
    final neighbouringTick = getNeighboringTick(
      desiredPosition,
      waveform,
      designer,
    );
    final value = getNewValue(waveform, designer, desiredPosition);
    ref
        .read(waveFormStateProvider.notifier)
        .addWaveformValue(WaveFormValueModel(
          tick: neighbouringTick,
          value: DoubleValue(value),
        ));
  }

  @override
  void addValue(int tick, WaveformPointValue value, WidgetRef ref) {
    if (!(value is DoubleValue)) {
      throw 'Received ${value.runtimeType}, value must be DoubleValue';
    }
    ref
        .read(waveFormStateProvider.notifier)
        .addWaveformValue(WaveFormValueModel(
          tick: tick,
          value: value,
        ));
  }
}
