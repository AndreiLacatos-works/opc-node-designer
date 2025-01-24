// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectionModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConnectionModelCopyWith<ConnectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionModelCopyWith<$Res> {
  factory $ConnectionModelCopyWith(
          ConnectionModel value, $Res Function(ConnectionModel) then) =
      _$ConnectionModelCopyWithImpl<$Res, ConnectionModel>;
  @useResult
  $Res call({String id, String name, String host, int port});
}

/// @nodoc
class _$ConnectionModelCopyWithImpl<$Res, $Val extends ConnectionModel>
    implements $ConnectionModelCopyWith<$Res> {
  _$ConnectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? host = null,
    Object? port = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionModelImplCopyWith<$Res>
    implements $ConnectionModelCopyWith<$Res> {
  factory _$$ConnectionModelImplCopyWith(_$ConnectionModelImpl value,
          $Res Function(_$ConnectionModelImpl) then) =
      __$$ConnectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String host, int port});
}

/// @nodoc
class __$$ConnectionModelImplCopyWithImpl<$Res>
    extends _$ConnectionModelCopyWithImpl<$Res, _$ConnectionModelImpl>
    implements _$$ConnectionModelImplCopyWith<$Res> {
  __$$ConnectionModelImplCopyWithImpl(
      _$ConnectionModelImpl _value, $Res Function(_$ConnectionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? host = null,
    Object? port = null,
  }) {
    return _then(_$ConnectionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ConnectionModelImpl implements _ConnectionModel {
  _$ConnectionModelImpl(
      {required this.id,
      required this.name,
      required this.host,
      required this.port});

  @override
  final String id;
  @override
  final String name;
  @override
  final String host;
  @override
  final int port;

  @override
  String toString() {
    return 'ConnectionModel(id: $id, name: $name, host: $host, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, host, port);

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionModelImplCopyWith<_$ConnectionModelImpl> get copyWith =>
      __$$ConnectionModelImplCopyWithImpl<_$ConnectionModelImpl>(
          this, _$identity);
}

abstract class _ConnectionModel implements ConnectionModel {
  factory _ConnectionModel(
      {required final String id,
      required final String name,
      required final String host,
      required final int port}) = _$ConnectionModelImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get host;
  @override
  int get port;

  /// Create a copy of ConnectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionModelImplCopyWith<_$ConnectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
