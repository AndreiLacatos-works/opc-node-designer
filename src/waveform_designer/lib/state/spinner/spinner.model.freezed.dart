// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spinner.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpinnerModel {
  bool get active => throw _privateConstructorUsedError;

  /// Create a copy of SpinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpinnerModelCopyWith<SpinnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpinnerModelCopyWith<$Res> {
  factory $SpinnerModelCopyWith(
          SpinnerModel value, $Res Function(SpinnerModel) then) =
      _$SpinnerModelCopyWithImpl<$Res, SpinnerModel>;
  @useResult
  $Res call({bool active});
}

/// @nodoc
class _$SpinnerModelCopyWithImpl<$Res, $Val extends SpinnerModel>
    implements $SpinnerModelCopyWith<$Res> {
  _$SpinnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpinnerModelImplCopyWith<$Res>
    implements $SpinnerModelCopyWith<$Res> {
  factory _$$SpinnerModelImplCopyWith(
          _$SpinnerModelImpl value, $Res Function(_$SpinnerModelImpl) then) =
      __$$SpinnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool active});
}

/// @nodoc
class __$$SpinnerModelImplCopyWithImpl<$Res>
    extends _$SpinnerModelCopyWithImpl<$Res, _$SpinnerModelImpl>
    implements _$$SpinnerModelImplCopyWith<$Res> {
  __$$SpinnerModelImplCopyWithImpl(
      _$SpinnerModelImpl _value, $Res Function(_$SpinnerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
  }) {
    return _then(_$SpinnerModelImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SpinnerModelImpl implements _SpinnerModel {
  _$SpinnerModelImpl({required this.active});

  @override
  final bool active;

  @override
  String toString() {
    return 'SpinnerModel(active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpinnerModelImpl &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode => Object.hash(runtimeType, active);

  /// Create a copy of SpinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpinnerModelImplCopyWith<_$SpinnerModelImpl> get copyWith =>
      __$$SpinnerModelImplCopyWithImpl<_$SpinnerModelImpl>(this, _$identity);
}

abstract class _SpinnerModel implements SpinnerModel {
  factory _SpinnerModel({required final bool active}) = _$SpinnerModelImpl;

  @override
  bool get active;

  /// Create a copy of SpinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpinnerModelImplCopyWith<_$SpinnerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
