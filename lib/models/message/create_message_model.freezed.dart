// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateMessageModel _$CreateMessageModelFromJson(Map<String, dynamic> json) {
  return _CreateMessageModel.fromJson(json);
}

/// @nodoc
mixin _$CreateMessageModel {
  String get userId => throw _privateConstructorUsedError;
  int get boxId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateMessageModelCopyWith<CreateMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateMessageModelCopyWith<$Res> {
  factory $CreateMessageModelCopyWith(
          CreateMessageModel value, $Res Function(CreateMessageModel) then) =
      _$CreateMessageModelCopyWithImpl<$Res, CreateMessageModel>;
  @useResult
  $Res call({String userId, int boxId, String content});
}

/// @nodoc
class _$CreateMessageModelCopyWithImpl<$Res, $Val extends CreateMessageModel>
    implements $CreateMessageModelCopyWith<$Res> {
  _$CreateMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? boxId = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateMessageModelImplCopyWith<$Res>
    implements $CreateMessageModelCopyWith<$Res> {
  factory _$$CreateMessageModelImplCopyWith(_$CreateMessageModelImpl value,
          $Res Function(_$CreateMessageModelImpl) then) =
      __$$CreateMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int boxId, String content});
}

/// @nodoc
class __$$CreateMessageModelImplCopyWithImpl<$Res>
    extends _$CreateMessageModelCopyWithImpl<$Res, _$CreateMessageModelImpl>
    implements _$$CreateMessageModelImplCopyWith<$Res> {
  __$$CreateMessageModelImplCopyWithImpl(_$CreateMessageModelImpl _value,
      $Res Function(_$CreateMessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? boxId = null,
    Object? content = null,
  }) {
    return _then(_$CreateMessageModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CreateMessageModelImpl implements _CreateMessageModel {
  const _$CreateMessageModelImpl(
      {required this.userId, required this.boxId, required this.content});

  factory _$CreateMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateMessageModelImplFromJson(json);

  @override
  final String userId;
  @override
  final int boxId;
  @override
  final String content;

  @override
  String toString() {
    return 'CreateMessageModel(userId: $userId, boxId: $boxId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateMessageModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.boxId, boxId) || other.boxId == boxId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, boxId, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateMessageModelImplCopyWith<_$CreateMessageModelImpl> get copyWith =>
      __$$CreateMessageModelImplCopyWithImpl<_$CreateMessageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateMessageModelImplToJson(
      this,
    );
  }
}

abstract class _CreateMessageModel implements CreateMessageModel {
  const factory _CreateMessageModel(
      {required final String userId,
      required final int boxId,
      required final String content}) = _$CreateMessageModelImpl;

  factory _CreateMessageModel.fromJson(Map<String, dynamic> json) =
      _$CreateMessageModelImpl.fromJson;

  @override
  String get userId;
  @override
  int get boxId;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$CreateMessageModelImplCopyWith<_$CreateMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
