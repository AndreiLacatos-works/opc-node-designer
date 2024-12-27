// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opc_structure.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OpcContainerNodeModel {
  List<OpcStructureNodeModel> get children =>
      throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Create a copy of OpcContainerNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpcContainerNodeModelCopyWith<OpcContainerNodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpcContainerNodeModelCopyWith<$Res> {
  factory $OpcContainerNodeModelCopyWith(OpcContainerNodeModel value,
          $Res Function(OpcContainerNodeModel) then) =
      _$OpcContainerNodeModelCopyWithImpl<$Res, OpcContainerNodeModel>;
  @useResult
  $Res call({List<OpcStructureNodeModel> children, String id, String label});
}

/// @nodoc
class _$OpcContainerNodeModelCopyWithImpl<$Res,
        $Val extends OpcContainerNodeModel>
    implements $OpcContainerNodeModelCopyWith<$Res> {
  _$OpcContainerNodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpcContainerNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<OpcStructureNodeModel>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpcContainerNodeModelImplCopyWith<$Res>
    implements $OpcContainerNodeModelCopyWith<$Res> {
  factory _$$OpcContainerNodeModelImplCopyWith(
          _$OpcContainerNodeModelImpl value,
          $Res Function(_$OpcContainerNodeModelImpl) then) =
      __$$OpcContainerNodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OpcStructureNodeModel> children, String id, String label});
}

/// @nodoc
class __$$OpcContainerNodeModelImplCopyWithImpl<$Res>
    extends _$OpcContainerNodeModelCopyWithImpl<$Res,
        _$OpcContainerNodeModelImpl>
    implements _$$OpcContainerNodeModelImplCopyWith<$Res> {
  __$$OpcContainerNodeModelImplCopyWithImpl(_$OpcContainerNodeModelImpl _value,
      $Res Function(_$OpcContainerNodeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpcContainerNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? children = null,
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$OpcContainerNodeModelImpl(
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<OpcStructureNodeModel>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OpcContainerNodeModelImpl implements _OpcContainerNodeModel {
  _$OpcContainerNodeModelImpl(
      {required final List<OpcStructureNodeModel> children,
      required this.id,
      required this.label})
      : _children = children;

  final List<OpcStructureNodeModel> _children;
  @override
  List<OpcStructureNodeModel> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final String id;
  @override
  final String label;

  @override
  String toString() {
    return 'OpcContainerNodeModel(children: $children, id: $id, label: $label)';
  }

  @override
  String getId() {
    return id;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpcContainerNodeModelImpl &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_children), id, label);

  /// Create a copy of OpcContainerNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpcContainerNodeModelImplCopyWith<_$OpcContainerNodeModelImpl>
      get copyWith => __$$OpcContainerNodeModelImplCopyWithImpl<
          _$OpcContainerNodeModelImpl>(this, _$identity);
}

abstract class _OpcContainerNodeModel implements OpcContainerNodeModel {
  factory _OpcContainerNodeModel(
      {required final List<OpcStructureNodeModel> children,
      required final String id,
      required final String label}) = _$OpcContainerNodeModelImpl;

  @override
  List<OpcStructureNodeModel> get children;
  @override
  String get id;
  @override
  String get label;

  /// Create a copy of OpcContainerNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpcContainerNodeModelImplCopyWith<_$OpcContainerNodeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OpcValueNodeModel {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  WaveFormModel get waveform => throw _privateConstructorUsedError;

  /// Create a copy of OpcValueNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpcValueNodeModelCopyWith<OpcValueNodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpcValueNodeModelCopyWith<$Res> {
  factory $OpcValueNodeModelCopyWith(
          OpcValueNodeModel value, $Res Function(OpcValueNodeModel) then) =
      _$OpcValueNodeModelCopyWithImpl<$Res, OpcValueNodeModel>;
  @useResult
  $Res call({String id, String label, WaveFormModel waveform});

  $WaveFormModelCopyWith<$Res> get waveform;
}

/// @nodoc
class _$OpcValueNodeModelCopyWithImpl<$Res, $Val extends OpcValueNodeModel>
    implements $OpcValueNodeModelCopyWith<$Res> {
  _$OpcValueNodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpcValueNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? waveform = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      waveform: null == waveform
          ? _value.waveform
          : waveform // ignore: cast_nullable_to_non_nullable
              as WaveFormModel,
    ) as $Val);
  }

  /// Create a copy of OpcValueNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WaveFormModelCopyWith<$Res> get waveform {
    return $WaveFormModelCopyWith<$Res>(_value.waveform, (value) {
      return _then(_value.copyWith(waveform: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpcValueNodeModelImplCopyWith<$Res>
    implements $OpcValueNodeModelCopyWith<$Res> {
  factory _$$OpcValueNodeModelImplCopyWith(_$OpcValueNodeModelImpl value,
          $Res Function(_$OpcValueNodeModelImpl) then) =
      __$$OpcValueNodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String label, WaveFormModel waveform});

  @override
  $WaveFormModelCopyWith<$Res> get waveform;
}

/// @nodoc
class __$$OpcValueNodeModelImplCopyWithImpl<$Res>
    extends _$OpcValueNodeModelCopyWithImpl<$Res, _$OpcValueNodeModelImpl>
    implements _$$OpcValueNodeModelImplCopyWith<$Res> {
  __$$OpcValueNodeModelImplCopyWithImpl(_$OpcValueNodeModelImpl _value,
      $Res Function(_$OpcValueNodeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpcValueNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? waveform = null,
  }) {
    return _then(_$OpcValueNodeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      waveform: null == waveform
          ? _value.waveform
          : waveform // ignore: cast_nullable_to_non_nullable
              as WaveFormModel,
    ));
  }
}

/// @nodoc

class _$OpcValueNodeModelImpl implements _OpcValueNodeModel {
  _$OpcValueNodeModelImpl(
      {required this.id, required this.label, required this.waveform});

  @override
  final String id;
  @override
  final String label;
  @override
  final WaveFormModel waveform;

  @override
  String toString() {
    return 'OpcValueNodeModel(id: $id, label: $label, waveform: $waveform)';
  }

  @override
  String getId() {
    return id;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpcValueNodeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.waveform, waveform) ||
                other.waveform == waveform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, waveform);

  /// Create a copy of OpcValueNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpcValueNodeModelImplCopyWith<_$OpcValueNodeModelImpl> get copyWith =>
      __$$OpcValueNodeModelImplCopyWithImpl<_$OpcValueNodeModelImpl>(
          this, _$identity);
}

abstract class _OpcValueNodeModel implements OpcValueNodeModel {
  factory _OpcValueNodeModel(
      {required final String id,
      required final String label,
      required final WaveFormModel waveform}) = _$OpcValueNodeModelImpl;

  @override
  String get id;
  @override
  String get label;
  @override
  WaveFormModel get waveform;

  /// Create a copy of OpcValueNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpcValueNodeModelImplCopyWith<_$OpcValueNodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OpcStructureModel {
  OpcContainerNodeModel get root => throw _privateConstructorUsedError;

  /// Create a copy of OpcStructureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpcStructureModelCopyWith<OpcStructureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpcStructureModelCopyWith<$Res> {
  factory $OpcStructureModelCopyWith(
          OpcStructureModel value, $Res Function(OpcStructureModel) then) =
      _$OpcStructureModelCopyWithImpl<$Res, OpcStructureModel>;
  @useResult
  $Res call({OpcContainerNodeModel root});

  $OpcContainerNodeModelCopyWith<$Res> get root;
}

/// @nodoc
class _$OpcStructureModelCopyWithImpl<$Res, $Val extends OpcStructureModel>
    implements $OpcStructureModelCopyWith<$Res> {
  _$OpcStructureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpcStructureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? root = null,
  }) {
    return _then(_value.copyWith(
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as OpcContainerNodeModel,
    ) as $Val);
  }

  /// Create a copy of OpcStructureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpcContainerNodeModelCopyWith<$Res> get root {
    return $OpcContainerNodeModelCopyWith<$Res>(_value.root, (value) {
      return _then(_value.copyWith(root: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpcStructureModelImplCopyWith<$Res>
    implements $OpcStructureModelCopyWith<$Res> {
  factory _$$OpcStructureModelImplCopyWith(_$OpcStructureModelImpl value,
          $Res Function(_$OpcStructureModelImpl) then) =
      __$$OpcStructureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OpcContainerNodeModel root});

  @override
  $OpcContainerNodeModelCopyWith<$Res> get root;
}

/// @nodoc
class __$$OpcStructureModelImplCopyWithImpl<$Res>
    extends _$OpcStructureModelCopyWithImpl<$Res, _$OpcStructureModelImpl>
    implements _$$OpcStructureModelImplCopyWith<$Res> {
  __$$OpcStructureModelImplCopyWithImpl(_$OpcStructureModelImpl _value,
      $Res Function(_$OpcStructureModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpcStructureModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? root = null,
  }) {
    return _then(_$OpcStructureModelImpl(
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as OpcContainerNodeModel,
    ));
  }
}

/// @nodoc

class _$OpcStructureModelImpl implements _OpcStructureModel {
  _$OpcStructureModelImpl({required this.root});

  @override
  final OpcContainerNodeModel root;

  @override
  String toString() {
    return 'OpcStructureModel(root: $root)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpcStructureModelImpl &&
            (identical(other.root, root) || other.root == root));
  }

  @override
  int get hashCode => Object.hash(runtimeType, root);

  /// Create a copy of OpcStructureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpcStructureModelImplCopyWith<_$OpcStructureModelImpl> get copyWith =>
      __$$OpcStructureModelImplCopyWithImpl<_$OpcStructureModelImpl>(
          this, _$identity);
}

abstract class _OpcStructureModel implements OpcStructureModel {
  factory _OpcStructureModel({required final OpcContainerNodeModel root}) =
      _$OpcStructureModelImpl;

  @override
  OpcContainerNodeModel get root;

  /// Create a copy of OpcStructureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpcStructureModelImplCopyWith<_$OpcStructureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
