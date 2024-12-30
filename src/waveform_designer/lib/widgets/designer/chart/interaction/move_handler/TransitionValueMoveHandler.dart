import 'package:flutter_riverpod/src/consumer.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/move_handler/AbstractMoveHandler.dart';

class TransitionValueMoveHandler extends AbstractMoveHandler
    with
        ValueRangeMapper,
        WaveformMinMaxer,
        RangeRestrictorMapper,
        PointTransformer,
        NeighboringTickCalculator {
  @override
  void handleMove(
    WaveFormValueModel<WaveformPointValue> value,
    ScreenSpacePoint newPosition,
    WidgetRef ref,
  ) {
    final waveForm = ref.read(waveFormStateProvider);
    final designer = ref.read(designerStateProvider);
    final tick = getNeighboringTick(newPosition, waveForm, designer);
    ref.read(waveFormStateProvider.notifier).moveToTick(
          value,
          tick,
        );
  }
}
