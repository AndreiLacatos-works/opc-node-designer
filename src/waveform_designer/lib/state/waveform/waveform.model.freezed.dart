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
mixin _$WaveFormModel {
  int get duration => throw _privateConstructorUsedError;
  int get tickFrequency => throw _privateConstructorUsedError;
  List<int> get transitionPoints => throw _privateConstructorUsedError;

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
  $Res call({int duration, int tickFrequency, List<int> transitionPoints});
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
    Object? transitionPoints = null,
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
      transitionPoints: null == transitionPoints
          ? _value.transitionPoints
          : transitionPoints // ignore: cast_nullable_to_non_nullable
              as List<int>,
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
  $Res call({int duration, int tickFrequency, List<int> transitionPoints});
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
    Object? transitionPoints = null,
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
      transitionPoints: null == transitionPoints
          ? _value._transitionPoints
          : transitionPoints // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$WaveFormModelImpl implements _WaveFormModel {
  _$WaveFormModelImpl(
      {required this.duration,
      required this.tickFrequency,
      required final List<int> transitionPoints})
      : _transitionPoints = transitionPoints;

  @override
  final int duration;
  @override
  final int tickFrequency;
  final List<int> _transitionPoints;
  @override
  List<int> get transitionPoints {
    if (_transitionPoints is EqualUnmodifiableListView)
      return _transitionPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transitionPoints);
  }

  @override
  String toString() {
    return 'WaveFormModel(duration: $duration, tickFrequency: $tickFrequency, transitionPoints: $transitionPoints)';
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
            const DeepCollectionEquality()
                .equals(other._transitionPoints, _transitionPoints));
  }

  @override
  int get hashCode => Object.hash(runtimeType, duration, tickFrequency,
      const DeepCollectionEquality().hash(_transitionPoints));

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
      required final List<int> transitionPoints}) = _$WaveFormModelImpl;

  @override
  int get duration;
  @override
  int get tickFrequency;
  @override
  List<int> get transitionPoints;

  /// Create a copy of WaveFormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaveFormModelImplCopyWith<_$WaveFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
