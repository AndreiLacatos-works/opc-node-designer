// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designer.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DesignerModel {
  double get designerWidth => throw _privateConstructorUsedError;
  double get sliceRatio => throw _privateConstructorUsedError;
  double get sliceOffset => throw _privateConstructorUsedError;

  /// Create a copy of DesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DesignerModelCopyWith<DesignerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignerModelCopyWith<$Res> {
  factory $DesignerModelCopyWith(
          DesignerModel value, $Res Function(DesignerModel) then) =
      _$DesignerModelCopyWithImpl<$Res, DesignerModel>;
  @useResult
  $Res call({double designerWidth, double sliceRatio, double sliceOffset});
}

/// @nodoc
class _$DesignerModelCopyWithImpl<$Res, $Val extends DesignerModel>
    implements $DesignerModelCopyWith<$Res> {
  _$DesignerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designerWidth = null,
    Object? sliceRatio = null,
    Object? sliceOffset = null,
  }) {
    return _then(_value.copyWith(
      designerWidth: null == designerWidth
          ? _value.designerWidth
          : designerWidth // ignore: cast_nullable_to_non_nullable
              as double,
      sliceRatio: null == sliceRatio
          ? _value.sliceRatio
          : sliceRatio // ignore: cast_nullable_to_non_nullable
              as double,
      sliceOffset: null == sliceOffset
          ? _value.sliceOffset
          : sliceOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DesignerModelImplCopyWith<$Res>
    implements $DesignerModelCopyWith<$Res> {
  factory _$$DesignerModelImplCopyWith(
          _$DesignerModelImpl value, $Res Function(_$DesignerModelImpl) then) =
      __$$DesignerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double designerWidth, double sliceRatio, double sliceOffset});
}

/// @nodoc
class __$$DesignerModelImplCopyWithImpl<$Res>
    extends _$DesignerModelCopyWithImpl<$Res, _$DesignerModelImpl>
    implements _$$DesignerModelImplCopyWith<$Res> {
  __$$DesignerModelImplCopyWithImpl(
      _$DesignerModelImpl _value, $Res Function(_$DesignerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? designerWidth = null,
    Object? sliceRatio = null,
    Object? sliceOffset = null,
  }) {
    return _then(_$DesignerModelImpl(
      designerWidth: null == designerWidth
          ? _value.designerWidth
          : designerWidth // ignore: cast_nullable_to_non_nullable
              as double,
      sliceRatio: null == sliceRatio
          ? _value.sliceRatio
          : sliceRatio // ignore: cast_nullable_to_non_nullable
              as double,
      sliceOffset: null == sliceOffset
          ? _value.sliceOffset
          : sliceOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DesignerModelImpl implements _DesignerModel {
  _$DesignerModelImpl(
      {required this.designerWidth,
      required this.sliceRatio,
      required this.sliceOffset});

  @override
  final double designerWidth;
  @override
  final double sliceRatio;
  @override
  final double sliceOffset;

  @override
  String toString() {
    return 'DesignerModel(designerWidth: $designerWidth, sliceRatio: $sliceRatio, sliceOffset: $sliceOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesignerModelImpl &&
            (identical(other.designerWidth, designerWidth) ||
                other.designerWidth == designerWidth) &&
            (identical(other.sliceRatio, sliceRatio) ||
                other.sliceRatio == sliceRatio) &&
            (identical(other.sliceOffset, sliceOffset) ||
                other.sliceOffset == sliceOffset));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, designerWidth, sliceRatio, sliceOffset);

  /// Create a copy of DesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DesignerModelImplCopyWith<_$DesignerModelImpl> get copyWith =>
      __$$DesignerModelImplCopyWithImpl<_$DesignerModelImpl>(this, _$identity);
}

abstract class _DesignerModel implements DesignerModel {
  factory _DesignerModel(
      {required final double designerWidth,
      required final double sliceRatio,
      required final double sliceOffset}) = _$DesignerModelImpl;

  @override
  double get designerWidth;
  @override
  double get sliceRatio;
  @override
  double get sliceOffset;

  /// Create a copy of DesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DesignerModelImplCopyWith<_$DesignerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
