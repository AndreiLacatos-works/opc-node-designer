import 'package:json_annotation/json_annotation.dart';
import 'package:opc_node_designer/state/waveform/waveform.model.dart'
    as WaveFormState;

part 'waveform.model.g.dart';

@JsonSerializable()
class WaveFormValueModel {
  final int tick;
  final double value;

  WaveFormValueModel({
    required this.tick,
    required this.value,
  });

  factory WaveFormValueModel.fromJson(Map<String, dynamic> json) =>
      _$WaveFormValueModelFromJson(json);

  factory WaveFormValueModel.fromState(
          WaveFormState.WaveFormValueModel state) =>
      WaveFormValueModel(
        tick: state.tick,
        value: state.value.getValue(),
      );

  Map<String, dynamic> toJson() => _$WaveFormValueModelToJson(this);

  WaveFormState.WaveFormValueModel toState() =>
      WaveFormState.WaveFormValueModel(
        tick: this.tick,
        value: WaveFormState.DoubleValue(this.value),
      );
}

enum WaveFormType {
  transitions,
  doubleValues,
}

@JsonSerializable(includeIfNull: false)
class WaveformMetaModel {
  final String? smoothing;

  WaveformMetaModel({
    this.smoothing,
  });

  static final Map<String, WaveFormState.SmoothingStrategy> _strategyMap = {
    "step": WaveFormState.SmoothingStrategy.step,
    "linear": WaveFormState.SmoothingStrategy.linear,
    "cubic": WaveFormState.SmoothingStrategy.cubic,
  };

  WaveFormState.WaveformMeta? toState(WaveFormType type) {
    return switch (type) {
      WaveFormType.doubleValues => WaveFormState.NumericWaveformMeta(
          smoothing: _strategyMap[smoothing]!,
        ),
      _ => null,
    };
  }

  factory WaveformMetaModel.fromState(WaveFormState.WaveformMeta state) {
    return switch (state.runtimeType) {
      WaveFormState.NumericWaveformMeta() => WaveformMetaModel(
          smoothing: _strategyMap.entries
                  .where((entry) =>
                      entry.value ==
                      (state as WaveFormState.NumericWaveformMeta).smoothing)
                  .firstOrNull
                  ?.key ??
              _strategyMap.keys.first,
        ),
      _ => WaveformMetaModel(),
    };
  }
}

@JsonSerializable()
class WaveFormModel {
  final int duration;
  final int tickFrequency;
  final WaveFormType type;
  final List<WaveFormValueModel> transitionPoints;
  final WaveformMetaModel? meta;

  WaveFormModel({
    required this.duration,
    required this.tickFrequency,
    required this.type,
    required this.transitionPoints,
    this.meta,
  });

  factory WaveFormModel.fromJson(Map<String, dynamic> json) =>
      _$WaveFormModelFromJson(json);

  factory WaveFormModel.fromState(WaveFormState.WaveFormModel state) =>
      WaveFormModel(
        duration: state.duration,
        tickFrequency: state.tickFrequency,
        type: _mapWaveFormTypeFromState(state),
        transitionPoints:
            state.values.map((n) => WaveFormValueModel.fromState(n)).toList(),
        meta: state.meta == null
            ? null
            : WaveformMetaModel.fromState(state.meta!),
      );

  Map<String, dynamic> toJson() => _$WaveFormModelToJson(this);

  WaveFormState.WaveFormModel toState() => WaveFormState.WaveFormModel(
        duration: this.duration,
        tickFrequency: this.tickFrequency,
        type: _mapTypeFromWaveFormType(this.type),
        meta: this.meta?.toState(type),
        values: this
            .transitionPoints
            .map(
              (v) => v.toState(),
            )
            .toList(),
      );

  static WaveFormType _mapWaveFormTypeFromState(
      WaveFormState.WaveFormModel state) {
    return switch (state.type) {
      WaveFormState.DoubleValue => WaveFormType.doubleValues,
      WaveFormState.Transition => WaveFormType.transitions,
      Type() => throw "${state.type} is not valid waveform value type!",
    };
  }

  static Type _mapTypeFromWaveFormType(WaveFormType type) {
    return switch (type) {
      WaveFormType.transitions => WaveFormState.Transition,
      WaveFormType.doubleValues => WaveFormState.DoubleValue,
    };
  }
}
