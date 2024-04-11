// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'box_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoxModel _$BoxModelFromJson(Map<String, dynamic> json) {
  return _BoxModel.fromJson(json);
}

/// @nodoc
mixin _$BoxModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoxModelCopyWith<BoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxModelCopyWith<$Res> {
  factory $BoxModelCopyWith(BoxModel value, $Res Function(BoxModel) then) =
      _$BoxModelCopyWithImpl<$Res, BoxModel>;
  @useResult
  $Res call({int id, String name, String address});
}

/// @nodoc
class _$BoxModelCopyWithImpl<$Res, $Val extends BoxModel>
    implements $BoxModelCopyWith<$Res> {
  _$BoxModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoxModelImplCopyWith<$Res>
    implements $BoxModelCopyWith<$Res> {
  factory _$$BoxModelImplCopyWith(
          _$BoxModelImpl value, $Res Function(_$BoxModelImpl) then) =
      __$$BoxModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String address});
}

/// @nodoc
class __$$BoxModelImplCopyWithImpl<$Res>
    extends _$BoxModelCopyWithImpl<$Res, _$BoxModelImpl>
    implements _$$BoxModelImplCopyWith<$Res> {
  __$$BoxModelImplCopyWithImpl(
      _$BoxModelImpl _value, $Res Function(_$BoxModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_$BoxModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoxModelImpl implements _BoxModel {
  const _$BoxModelImpl(
      {required this.id, required this.name, required this.address});

  factory _$BoxModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoxModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;

  @override
  String toString() {
    return 'BoxModel(id: $id, name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoxModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoxModelImplCopyWith<_$BoxModelImpl> get copyWith =>
      __$$BoxModelImplCopyWithImpl<_$BoxModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoxModelImplToJson(
      this,
    );
  }
}

abstract class _BoxModel implements BoxModel {
  const factory _BoxModel(
      {required final int id,
      required final String name,
      required final String address}) = _$BoxModelImpl;

  factory _BoxModel.fromJson(Map<String, dynamic> json) =
      _$BoxModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$BoxModelImplCopyWith<_$BoxModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
