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
mixin _$WaveFormValueModel<T extends DoubleConvertible> {
  int get tick => throw _privateConstructorUsedError;
  T get value => throw _privateConstructorUsedError;

  /// Create a copy of WaveFormValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaveFormValueModelCopyWith<T, WaveFormValueModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaveFormValueModelCopyWith<T extends DoubleConvertible, $Res> {
  factory $WaveFormValueModelCopyWith(WaveFormValueModel<T> value,
          $Res Function(WaveFormValueModel<T>) then) =
      _$WaveFormValueModelCopyWithImpl<T, $Res, WaveFormValueModel<T>>;
  @useResult
  $Res call({int tick, T value});
}

/// @nodoc
class _$WaveFormValueModelCopyWithImpl<T extends DoubleConvertible, $Res,
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
abstract class _$$WaveFormValueImplCopyWith<T extends DoubleConvertible, $Res>
    implements $WaveFormValueModelCopyWith<T, $Res> {
  factory _$$WaveFormValueImplCopyWith(_$WaveFormValueImpl<T> value,
          $Res Function(_$WaveFormValueImpl<T>) then) =
      __$$WaveFormValueImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int tick, T value});
}

/// @nodoc
class __$$WaveFormValueImplCopyWithImpl<T extends DoubleConvertible, $Res>
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

class _$WaveFormValueImpl<T extends DoubleConvertible>
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

abstract class _WaveFormValue<T extends DoubleConvertible>
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
mixin _$WaveFormModel {
  int get duration => throw _privateConstructorUsedError;
  int get tickFrequency => throw _privateConstructorUsedError;
  List<WaveFormValueModel<DoubleConvertible>> get values =>
      throw _privateConstructorUsedError;

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaveFormModelCopyWith<WaveFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaveFormModelCopyWith<$Res> {
  factory $WaveFormModelCopyWith(
          WaveFormModel value, $Res Function(WaveFormModel) then) =
      _$WaveFormModelCopyWithImpl<$Res, WaveFormModel>;
  @useResult
  $Res call(
      {int duration,
      int tickFrequency,
      List<WaveFormValueModel<DoubleConvertible>> values});
}

/// @nodoc
class _$WaveFormModelCopyWithImpl<$Res, $Val extends WaveFormModel>
    implements $WaveFormModelCopyWith<$Res> {
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
    Object? values = null,
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
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<WaveFormValueModel<DoubleConvertible>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaveFormModelImplCopyWith<$Res>
    implements $WaveFormModelCopyWith<$Res> {
  factory _$$WaveFormModelImplCopyWith(
          _$WaveFormModelImpl value, $Res Function(_$WaveFormModelImpl) then) =
      __$$WaveFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int duration,
      int tickFrequency,
      List<WaveFormValueModel<DoubleConvertible>> values});
}

/// @nodoc
class __$$WaveFormModelImplCopyWithImpl<$Res>
    extends _$WaveFormModelCopyWithImpl<$Res, _$WaveFormModelImpl>
    implements _$$WaveFormModelImplCopyWith<$Res> {
  __$$WaveFormModelImplCopyWithImpl(
      _$WaveFormModelImpl _value, $Res Function(_$WaveFormModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? tickFrequency = null,
    Object? values = null,
  }) {
    return _then(_$WaveFormModelImpl(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      tickFrequency: null == tickFrequency
          ? _value.tickFrequency
          : tickFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<WaveFormValueModel<DoubleConvertible>>,
    ));
  }
}

/// @nodoc

class _$WaveFormModelImpl implements _WaveFormModel {
  _$WaveFormModelImpl(
      {required this.duration,
      required this.tickFrequency,
      required final List<WaveFormValueModel<DoubleConvertible>> values})
      : _values = values;

  @override
  final int duration;
  @override
  final int tickFrequency;
  final List<WaveFormValueModel<DoubleConvertible>> _values;
  @override
  List<WaveFormValueModel<DoubleConvertible>> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString() {
    return 'WaveFormModel(duration: $duration, tickFrequency: $tickFrequency, values: $values)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaveFormModelImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.tickFrequency, tickFrequency) ||
                other.tickFrequency == tickFrequency) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, tickFrequency,
      const DeepCollectionEquality().hash(_values));

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaveFormModelImplCopyWith<_$WaveFormModelImpl> get copyWith =>
      __$$WaveFormModelImplCopyWithImpl<_$WaveFormModelImpl>(this, _$identity);
}

abstract class _WaveFormModel implements WaveFormModel {
  factory _WaveFormModel(
          {required final int duration,
          required final int tickFrequency,
          required final List<WaveFormValueModel<DoubleConvertible>> values}) =
      _$WaveFormModelImpl;

  @override
  int get duration;
  @override
  int get tickFrequency;
  @override
  List<WaveFormValueModel<DoubleConvertible>> get values;

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaveFormModelImplCopyWith<_$WaveFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
