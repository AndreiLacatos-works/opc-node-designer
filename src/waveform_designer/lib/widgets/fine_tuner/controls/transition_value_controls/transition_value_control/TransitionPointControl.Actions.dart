import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';
import 'package:waveform_designer/state/waveform/waveform.state.dart';
import 'package:waveform_designer/widgets/fine_tuner/controls/ErrorConsumerState.dart';

mixin TransitionPointControlActions {
  void _handleMove(WaveFormValueModel value, int newTick, WidgetRef ref) {
    try {
      ref.read(waveFormStateProvider.notifier).moveToTick(value, newTick);
      _clearError();
    } on String catch (e) {
      _setError(e);
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
      _clearError();
    } on String catch (e) {
      _setError(e);
    }
  }

  void _clearError() {
    if (this is ErrorHandler) {
      (this as ErrorHandler).clearError();
    }
  }

  void _setError(String e) {
    if (this is ErrorHandler) {
      (this as ErrorHandler).setError(e);
    }
  }
}
