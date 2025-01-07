// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waveform.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WaveFormValueModel<T extends WaveformPointValue> {
  int get tick => throw _privateConstructorUsedError;
  T get value => throw _privateConstructorUsedError;

  /// Create a copy of WaveFormValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaveFormValueModelCopyWith<T, WaveFormValueModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaveFormValueModelCopyWith<T extends WaveformPointValue, $Res> {
  factory $WaveFormValueModelCopyWith(WaveFormValueModel<T> value,
          $Res Function(WaveFormValueModel<T>) then) =
      _$WaveFormValueModelCopyWithImpl<T, $Res, WaveFormValueModel<T>>;
  @useResult
  $Res call({int tick, T value});
}

/// @nodoc
class _$WaveFormValueModelCopyWithImpl<T extends WaveformPointValue, $Res,
        $Val extends WaveFormValueModel<T>>
    implements $WaveFormValueModelCopyWith<T, $Res> {
  _$WaveFormValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaveFormValueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tick = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      tick: null == tick
          ? _value.tick
          : tick // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaveFormValueImplCopyWith<T extends WaveformPointValue, $Res>
    implements $WaveFormValueModelCopyWith<T, $Res> {
  factory _$$WaveFormValueImplCopyWith(_$WaveFormValueImpl<T> value,
          $Res Function(_$WaveFormValueImpl<T>) then) =
      __$$WaveFormValueImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int tick, T value});
}

/// @nodoc
class __$$WaveFormValueImplCopyWithImpl<T extends WaveformPointValue, $Res>
    extends _$WaveFormValueModelCopyWithImpl<T, $Res, _$WaveFormValueImpl<T>>
    implements _$$WaveFormValueImplCopyWith<T, $Res> {
  __$$WaveFormValueImplCopyWithImpl(_$WaveFormValueImpl<T> _value,
      $Res Function(_$WaveFormValueImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of WaveFormValueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tick = null,
    Object? value = null,
  }) {
    return _then(_$WaveFormValueImpl<T>(
      tick: null == tick
          ? _value.tick
          : tick // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$WaveFormValueImpl<T extends WaveformPointValue>
    extends _WaveFormValue<T> {
  _$WaveFormValueImpl({required this.tick, required this.value}) : super._();

  @override
  final int tick;
  @override
  final T value;

  @override
  String toString() {
    return 'WaveFormValueModel<$T>(tick: $tick, value: $value)';
  }

  /// Create a copy of WaveFormValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaveFormValueImplCopyWith<T, _$WaveFormValueImpl<T>> get copyWith =>
      __$$WaveFormValueImplCopyWithImpl<T, _$WaveFormValueImpl<T>>(
          this, _$identity);
}

abstract class _WaveFormValue<T extends WaveformPointValue>
    extends WaveFormValueModel<T> {
  factory _WaveFormValue({required final int tick, required final T value}) =
      _$WaveFormValueImpl<T>;
  _WaveFormValue._() : super._();

  @override
  int get tick;
  @override
  T get value;

  /// Create a copy of WaveFormValueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaveFormValueImplCopyWith<T, _$WaveFormValueImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NumericWaveformMeta {
  SmoothingStrategy get smoothing => throw _privateConstructorUsedError;

  /// Create a copy of NumericWaveformMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NumericWaveformMetaCopyWith<NumericWaveformMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumericWaveformMetaCopyWith<$Res> {
  factory $NumericWaveformMetaCopyWith(
          NumericWaveformMeta value, $Res Function(NumericWaveformMeta) then) =
      _$NumericWaveformMetaCopyWithImpl<$Res, NumericWaveformMeta>;
  @useResult
  $Res call({SmoothingStrategy smoothing});
}

/// @nodoc
class _$NumericWaveformMetaCopyWithImpl<$Res, $Val extends NumericWaveformMeta>
    implements $NumericWaveformMetaCopyWith<$Res> {
  _$NumericWaveformMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NumericWaveformMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smoothing = null,
  }) {
    return _then(_value.copyWith(
      smoothing: null == smoothing
          ? _value.smoothing
          : smoothing // ignore: cast_nullable_to_non_nullable
              as SmoothingStrategy,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NumericWaveformMetaImplCopyWith<$Res>
    implements $NumericWaveformMetaCopyWith<$Res> {
  factory _$$NumericWaveformMetaImplCopyWith(_$NumericWaveformMetaImpl value,
          $Res Function(_$NumericWaveformMetaImpl) then) =
      __$$NumericWaveformMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SmoothingStrategy smoothing});
}

/// @nodoc
class __$$NumericWaveformMetaImplCopyWithImpl<$Res>
    extends _$NumericWaveformMetaCopyWithImpl<$Res, _$NumericWaveformMetaImpl>
    implements _$$NumericWaveformMetaImplCopyWith<$Res> {
  __$$NumericWaveformMetaImplCopyWithImpl(_$NumericWaveformMetaImpl _value,
      $Res Function(_$NumericWaveformMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of NumericWaveformMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? smoothing = null,
  }) {
    return _then(_$NumericWaveformMetaImpl(
      smoothing: null == smoothing
          ? _value.smoothing
          : smoothing // ignore: cast_nullable_to_non_nullable
              as SmoothingStrategy,
    ));
  }
}

/// @nodoc

class _$NumericWaveformMetaImpl implements _NumericWaveformMeta {
  _$NumericWaveformMetaImpl({required this.smoothing});

  @override
  final SmoothingStrategy smoothing;

  @override
  String toString() {
    return 'NumericWaveformMeta(smoothing: $smoothing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NumericWaveformMetaImpl &&
            (identical(other.smoothing, smoothing) ||
                other.smoothing == smoothing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, smoothing);

  /// Create a copy of NumericWaveformMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NumericWaveformMetaImplCopyWith<_$NumericWaveformMetaImpl> get copyWith =>
      __$$NumericWaveformMetaImplCopyWithImpl<_$NumericWaveformMetaImpl>(
          this, _$identity);
}

abstract class _NumericWaveformMeta implements NumericWaveformMeta {
  factory _NumericWaveformMeta({required final SmoothingStrategy smoothing}) =
      _$NumericWaveformMetaImpl;

  @override
  SmoothingStrategy get smoothing;

  /// Create a copy of NumericWaveformMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NumericWaveformMetaImplCopyWith<_$NumericWaveformMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WaveFormModel<T extends WaveformPointValue> {
  int get duration => throw _privateConstructorUsedError;
  int get tickFrequency => throw _privateConstructorUsedError;
  Type get type => throw _privateConstructorUsedError;
  List<WaveFormValueModel<T>> get values => throw _privateConstructorUsedError;
  WaveformMeta? get meta => throw _privateConstructorUsedError;

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaveFormModelCopyWith<T, WaveFormModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaveFormModelCopyWith<T extends WaveformPointValue, $Res> {
  factory $WaveFormModelCopyWith(
          WaveFormModel<T> value, $Res Function(WaveFormModel<T>) then) =
      _$WaveFormModelCopyWithImpl<T, $Res, WaveFormModel<T>>;
  @useResult
  $Res call(
      {int duration,
      int tickFrequency,
      Type type,
      List<WaveFormValueModel<T>> values,
      WaveformMeta? meta});
}

/// @nodoc
class _$WaveFormModelCopyWithImpl<T extends WaveformPointValue, $Res,
    $Val extends WaveFormModel<T>> implements $WaveFormModelCopyWith<T, $Res> {
  _$WaveFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? tickFrequency = null,
    Object? type = null,
    Object? values = null,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      tickFrequency: null == tickFrequency
          ? _value.tickFrequency
          : tickFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<WaveFormValueModel<T>>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as WaveformMeta?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaveFormModelImplCopyWith<T extends WaveformPointValue, $Res>
    implements $WaveFormModelCopyWith<T, $Res> {
  factory _$$WaveFormModelImplCopyWith(_$WaveFormModelImpl<T> value,
          $Res Function(_$WaveFormModelImpl<T>) then) =
      __$$WaveFormModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int duration,
      int tickFrequency,
      Type type,
      List<WaveFormValueModel<T>> values,
      WaveformMeta? meta});
}

/// @nodoc
class __$$WaveFormModelImplCopyWithImpl<T extends WaveformPointValue, $Res>
    extends _$WaveFormModelCopyWithImpl<T, $Res, _$WaveFormModelImpl<T>>
    implements _$$WaveFormModelImplCopyWith<T, $Res> {
  __$$WaveFormModelImplCopyWithImpl(_$WaveFormModelImpl<T> _value,
      $Res Function(_$WaveFormModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? tickFrequency = null,
    Object? type = null,
    Object? values = null,
    Object? meta = freezed,
  }) {
    return _then(_$WaveFormModelImpl<T>(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      tickFrequency: null == tickFrequency
          ? _value.tickFrequency
          : tickFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<WaveFormValueModel<T>>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as WaveformMeta?,
    ));
  }
}

/// @nodoc

class _$WaveFormModelImpl<T extends WaveformPointValue>
    implements _WaveFormModel<T> {
  _$WaveFormModelImpl(
      {required this.duration,
      required this.tickFrequency,
      required this.type,
      required final List<WaveFormValueModel<T>> values,
      required this.meta})
      : _values = values;

  @override
  final int duration;
  @override
  final int tickFrequency;
  @override
  final Type type;
  final List<WaveFormValueModel<T>> _values;
  @override
  List<WaveFormValueModel<T>> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  final WaveformMeta? meta;

  @override
  String toString() {
    return 'WaveFormModel<$T>(duration: $duration, tickFrequency: $tickFrequency, type: $type, values: $values, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaveFormModelImpl<T> &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.tickFrequency, tickFrequency) ||
                other.tickFrequency == tickFrequency) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, tickFrequency, type,
      const DeepCollectionEquality().hash(_values), meta);

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaveFormModelImplCopyWith<T, _$WaveFormModelImpl<T>> get copyWith =>
      __$$WaveFormModelImplCopyWithImpl<T, _$WaveFormModelImpl<T>>(
          this, _$identity);
}

abstract class _WaveFormModel<T extends WaveformPointValue>
    implements WaveFormModel<T> {
  factory _WaveFormModel(
      {required final int duration,
      required final int tickFrequency,
      required final Type type,
      required final List<WaveFormValueModel<T>> values,
      required final WaveformMeta? meta}) = _$WaveFormModelImpl<T>;

  @override
  int get duration;
  @override
  int get tickFrequency;
  @override
  Type get type;
  @override
  List<WaveFormValueModel<T>> get values;
  @override
  WaveformMeta? get meta;

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaveFormModelImplCopyWith<T, _$WaveFormModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
