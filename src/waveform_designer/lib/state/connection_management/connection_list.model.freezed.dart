// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_list.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectionListModel {
  List<ConnectionModel> get connections => throw _privateConstructorUsedError;

  /// Create a copy of ConnectionListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectionListModelCopyWith<ConnectionListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionListModelCopyWith<$Res> {
  factory $ConnectionListModelCopyWith(
          ConnectionListModel value, $Res Function(ConnectionListModel) then) =
      _$ConnectionListModelCopyWithImpl<$Res, ConnectionListModel>;
  @useResult
  $Res call({List<ConnectionModel> connections});
}

/// @nodoc
class _$ConnectionListModelCopyWithImpl<$Res, $Val extends ConnectionListModel>
    implements $ConnectionListModelCopyWith<$Res> {
  _$ConnectionListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connections = null,
  }) {
    return _then(_value.copyWith(
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<ConnectionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionListModelImplCopyWith<$Res>
    implements $ConnectionListModelCopyWith<$Res> {
  factory _$$ConnectionListModelImplCopyWith(_$ConnectionListModelImpl value,
          $Res Function(_$ConnectionListModelImpl) then) =
      __$$ConnectionListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ConnectionModel> connections});
}

/// @nodoc
class __$$ConnectionListModelImplCopyWithImpl<$Res>
    extends _$ConnectionListModelCopyWithImpl<$Res, _$ConnectionListModelImpl>
    implements _$$ConnectionListModelImplCopyWith<$Res> {
  __$$ConnectionListModelImplCopyWithImpl(_$ConnectionListModelImpl _value,
      $Res Function(_$ConnectionListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connections = null,
  }) {
    return _then(_$ConnectionListModelImpl(
      connections: null == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as List<ConnectionModel>,
    ));
  }
}

/// @nodoc

class _$ConnectionListModelImpl implements _ConnectionListModel {
  _$ConnectionListModelImpl({required final List<ConnectionModel> connections})
      : _connections = connections;

  final List<ConnectionModel> _connections;
  @override
  List<ConnectionModel> get connections {
    if (_connections is EqualUnmodifiableListView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connections);
  }

  @override
  String toString() {
    return 'ConnectionListModel(connections: $connections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionListModelImpl &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_connections));

  /// Create a copy of ConnectionListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionListModelImplCopyWith<_$ConnectionListModelImpl> get copyWith =>
      __$$ConnectionListModelImplCopyWithImpl<_$ConnectionListModelImpl>(
          this, _$identity);
}

abstract class _ConnectionListModel implements ConnectionListModel {
  factory _ConnectionListModel(
          {required final List<ConnectionModel> connections}) =
      _$ConnectionListModelImpl;

  @override
  List<ConnectionModel> get connections;

  /// Create a copy of ConnectionListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionListModelImplCopyWith<_$ConnectionListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
