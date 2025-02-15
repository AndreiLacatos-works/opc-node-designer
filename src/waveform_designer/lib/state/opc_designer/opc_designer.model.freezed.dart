// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opc_designer.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OpcDesignerModel {
  OpcStructureNodeModel? get selectedNode => throw _privateConstructorUsedError;
  List<OpcContainerNodeModel> get expandedContainers =>
      throw _privateConstructorUsedError;

  /// Create a copy of OpcDesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpcDesignerModelCopyWith<OpcDesignerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpcDesignerModelCopyWith<$Res> {
  factory $OpcDesignerModelCopyWith(
          OpcDesignerModel value, $Res Function(OpcDesignerModel) then) =
      _$OpcDesignerModelCopyWithImpl<$Res, OpcDesignerModel>;
  @useResult
  $Res call(
      {OpcStructureNodeModel? selectedNode,
      List<OpcContainerNodeModel> expandedContainers});
}

/// @nodoc
class _$OpcDesignerModelCopyWithImpl<$Res, $Val extends OpcDesignerModel>
    implements $OpcDesignerModelCopyWith<$Res> {
  _$OpcDesignerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpcDesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNode = freezed,
    Object? expandedContainers = null,
  }) {
    return _then(_value.copyWith(
      selectedNode: freezed == selectedNode
          ? _value.selectedNode
          : selectedNode // ignore: cast_nullable_to_non_nullable
              as OpcStructureNodeModel?,
      expandedContainers: null == expandedContainers
          ? _value.expandedContainers
          : expandedContainers // ignore: cast_nullable_to_non_nullable
              as List<OpcContainerNodeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpcDesignerModelImplCopyWith<$Res>
    implements $OpcDesignerModelCopyWith<$Res> {
  factory _$$OpcDesignerModelImplCopyWith(_$OpcDesignerModelImpl value,
          $Res Function(_$OpcDesignerModelImpl) then) =
      __$$OpcDesignerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OpcStructureNodeModel? selectedNode,
      List<OpcContainerNodeModel> expandedContainers});
}

/// @nodoc
class __$$OpcDesignerModelImplCopyWithImpl<$Res>
    extends _$OpcDesignerModelCopyWithImpl<$Res, _$OpcDesignerModelImpl>
    implements _$$OpcDesignerModelImplCopyWith<$Res> {
  __$$OpcDesignerModelImplCopyWithImpl(_$OpcDesignerModelImpl _value,
      $Res Function(_$OpcDesignerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpcDesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNode = freezed,
    Object? expandedContainers = null,
  }) {
    return _then(_$OpcDesignerModelImpl(
      selectedNode: freezed == selectedNode
          ? _value.selectedNode
          : selectedNode // ignore: cast_nullable_to_non_nullable
              as OpcStructureNodeModel?,
      expandedContainers: null == expandedContainers
          ? _value._expandedContainers
          : expandedContainers // ignore: cast_nullable_to_non_nullable
              as List<OpcContainerNodeModel>,
    ));
  }
}

/// @nodoc

class _$OpcDesignerModelImpl implements _OpcDesignerModel {
  _$OpcDesignerModelImpl(
      {required this.selectedNode,
      required final List<OpcContainerNodeModel> expandedContainers})
      : _expandedContainers = expandedContainers;

  @override
  final OpcStructureNodeModel? selectedNode;
  final List<OpcContainerNodeModel> _expandedContainers;
  @override
  List<OpcContainerNodeModel> get expandedContainers {
    if (_expandedContainers is EqualUnmodifiableListView)
      return _expandedContainers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expandedContainers);
  }

  @override
  String toString() {
    return 'OpcDesignerModel(selectedNode: $selectedNode, expandedContainers: $expandedContainers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpcDesignerModelImpl &&
            (identical(other.selectedNode, selectedNode) ||
                other.selectedNode == selectedNode) &&
            const DeepCollectionEquality()
                .equals(other._expandedContainers, _expandedContainers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedNode,
      const DeepCollectionEquality().hash(_expandedContainers));

  /// Create a copy of OpcDesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpcDesignerModelImplCopyWith<_$OpcDesignerModelImpl> get copyWith =>
      __$$OpcDesignerModelImplCopyWithImpl<_$OpcDesignerModelImpl>(
          this, _$identity);
}

abstract class _OpcDesignerModel implements OpcDesignerModel {
  factory _OpcDesignerModel(
          {required final OpcStructureNodeModel? selectedNode,
          required final List<OpcContainerNodeModel> expandedContainers}) =
      _$OpcDesignerModelImpl;

  @override
  OpcStructureNodeModel? get selectedNode;
  @override
  List<OpcContainerNodeModel> get expandedContainers;

  /// Create a copy of OpcDesignerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpcDesignerModelImplCopyWith<_$OpcDesignerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
