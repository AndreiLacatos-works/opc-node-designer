import 'package:freezed_annotation/freezed_annotation.dart';

part 'waveform.model.freezed.dart';

abstract class DoubleConvertible {
  double toDouble();
}

class Unit extends DoubleConvertible {
  @override
  double toDouble() => 0.0;
}

class DoubleValue extends DoubleConvertible {
  final double value;

  DoubleValue(this.value);

  @override
  double toDouble() => 0.0;
}

@freezed
class WaveFormValueModel<T extends DoubleConvertible>
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

@freezed
class WaveFormModel with _$WaveFormModel {
  factory WaveFormModel({
    required int duration,
    required int tickFrequency,
    required List<WaveFormValueModel> values,
  }) = _WaveFormModel;
}
