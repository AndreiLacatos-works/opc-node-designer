import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/calc/ValueRangeMapper.dart';
import 'package:waveform_designer/state/designer/designer.state.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/NeighboringTickCalculator.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/PointTransformer.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/WaveformMinMaxer.dart';
import 'package:waveform_designer/widgets/designer/chart/chart_painters/RangeRestrictorMapper.dart';
import 'package:waveform_designer/widgets/designer/chart/interaction/add_handler/AbstractValueAddHandler.dart';

class TransitionValueAddHandler extends AbstractValueAddHandler
    with
        ValueRangeMapper,
        RangeRestrictorMapper,
        WaveformMinMaxer,
        PointTransformer,
        NeighboringTickCalculator {
  @override
  void addValue(
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
    ref
        .read(waveFormStateProvider.notifier)
        .addWaveformValue(WaveFormValueModel(
          tick: neighbouringTick,
          value: Transition(),
        ));
  }
}
