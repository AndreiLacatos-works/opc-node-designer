import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/widgets/designer/chart/calc/ScreenSpacePoint.dart';

abstract class AbstractMoveHandler {
  void handleMove(
    WaveFormValueModel value,
    ScreenSpacePoint newPosition,
    WidgetRef ref,
  );
}
