import 'package:freezed_annotation/freezed_annotation.dart';

part 'waveform.model.freezed.dart';

abstract class WaveformPointValue {
  double getValue();
}

class Void extends WaveformPointValue {
  @override
  double getValue() => 0.0;
}

class Transition extends WaveformPointValue {
  @override
  double getValue() => 0.0;
}

class DoubleValue extends WaveformPointValue {
  final double value;

  DoubleValue(double value) : value = double.parse(value.toStringAsFixed(2));

  @override
  double getValue() => value;
}

@freezed
class WaveFormValueModel<T extends WaveformPointValue>
    with _$WaveFormValueModel {
  factory WaveFormValueModel({
    required int tick,
    required T value,
  }) = _WaveFormValue<T>;

  const WaveFormValueModel._();

  @override
  bool operator ==(Object other) {
    return other is WaveFormValueModel<T> && other.tick == tick;
  }

  @override
  int get hashCode => tick.hashCode;
}

enum SmoothingStrategy { step, linear, cubic }

abstract class WaveformMeta {
  Type getType();
}

@freezed
class NumericWaveformMeta extends WaveformMeta with _$NumericWaveformMeta {
  factory NumericWaveformMeta({
    required SmoothingStrategy smoothing,
  }) = _NumericWaveformMeta;

  Type getType() => NumericWaveformMeta;
}

@freezed
class WaveFormModel<T extends WaveformPointValue> with _$WaveFormModel {
  factory WaveFormModel({
    required int duration,
    required int tickFrequency,
    required Type type,
    required List<WaveFormValueModel<T>> values,
    required WaveformMeta? meta,
  }) = _WaveFormModel;
}
