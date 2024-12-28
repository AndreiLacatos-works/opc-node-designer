import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';

mixin TransitionPointControlActions {
  void _handleMove(WaveFormValueModel value, int newTick, WidgetRef ref) {
    try {
      ref.read(waveFormStateProvider.notifier).moveToTick(value, newTick);
      // clearError();
    } on String catch (e) {
      // setError(e);
    }
  }

  void handleTickChange(
    WaveFormValueModel point,
    int? newTick,
    WidgetRef ref,
  ) {
    if (newTick == null) {
      return;
    }
    _handleMove(point, newTick, ref);
  }

  void moveLeft(WaveFormValueModel point, WidgetRef ref) {
    final waveform = ref.read(waveFormStateProvider);
    _handleMove(
      point,
      point.tick - waveform.tickFrequency,
      ref,
    );
  }

  void moveRight(WaveFormValueModel point, WidgetRef ref) {
    final waveform = ref.read(waveFormStateProvider);
    _handleMove(
      point,
      point.tick + waveform.tickFrequency,
      ref,
    );
  }

  void handleRemove(WaveFormValueModel point, WidgetRef ref) {
    try {
      ref.read(waveFormStateProvider.notifier).removeWaveformValue(point);
      // clearError();
    } on String catch (e) {
      // setError(e);
    }
  }
}
