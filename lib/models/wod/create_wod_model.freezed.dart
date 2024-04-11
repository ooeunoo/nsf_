// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_wod_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateWodModel _$CreateWodModelFromJson(Map<String, dynamic> json) {
  return _CreateWodModel.fromJson(json);
}

/// @nodoc
mixin _$CreateWodModel {
  String? get userId => throw _privateConstructorUsedError;
  int? get boxId => throw _privateConstructorUsedError;
  WodType? get type => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool? get hasTimeLimit => throw _privateConstructorUsedError;
  String? get timeLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateWodModelCopyWith<CreateWodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateWodModelCopyWith<$Res> {
  factory $CreateWodModelCopyWith(
          CreateWodModel value, $Res Function(CreateWodModel) then) =
      _$CreateWodModelCopyWithImpl<$Res, CreateWodModel>;
  @useResult
  $Res call(
      {String? userId,
      int? boxId,
      WodType? type,
      DateTime? date,
      bool? hasTimeLimit,
      String? timeLimit});
}

/// @nodoc
class _$CreateWodModelCopyWithImpl<$Res, $Val extends CreateWodModel>
    implements $CreateWodModelCopyWith<$Res> {
  _$CreateWodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? boxId = freezed,
    Object? type = freezed,
    Object? date = freezed,
    Object? hasTimeLimit = freezed,
    Object? timeLimit = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      boxId: freezed == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WodType?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTimeLimit: freezed == hasTimeLimit
          ? _value.hasTimeLimit
          : hasTimeLimit // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateWodModelImplCopyWith<$Res>
    implements $CreateWodModelCopyWith<$Res> {
  factory _$$CreateWodModelImplCopyWith(_$CreateWodModelImpl value,
          $Res Function(_$CreateWodModelImpl) then) =
      __$$CreateWodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      int? boxId,
      WodType? type,
      DateTime? date,
      bool? hasTimeLimit,
      String? timeLimit});
}

/// @nodoc
class __$$CreateWodModelImplCopyWithImpl<$Res>
    extends _$CreateWodModelCopyWithImpl<$Res, _$CreateWodModelImpl>
    implements _$$CreateWodModelImplCopyWith<$Res> {
  __$$CreateWodModelImplCopyWithImpl(
      _$CreateWodModelImpl _value, $Res Function(_$CreateWodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? boxId = freezed,
    Object? type = freezed,
    Object? date = freezed,
    Object? hasTimeLimit = freezed,
    Object? timeLimit = freezed,
  }) {
    return _then(_$CreateWodModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      boxId: freezed == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WodType?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasTimeLimit: freezed == hasTimeLimit
          ? _value.hasTimeLimit
          : hasTimeLimit // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CreateWodModelImpl implements _CreateWodModel {
  const _$CreateWodModelImpl(
      {this.userId,
      this.boxId,
      this.type,
      this.date,
      this.hasTimeLimit,
      this.timeLimit});

  factory _$CreateWodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWodModelImplFromJson(json);

  @override
  final String? userId;
  @override
  final int? boxId;
  @override
  final WodType? type;
  @override
  final DateTime? date;
  @override
  final bool? hasTimeLimit;
  @override
  final String? timeLimit;

  @override
  String toString() {
    return 'CreateWodModel(userId: $userId, boxId: $boxId, type: $type, date: $date, hasTimeLimit: $hasTimeLimit, timeLimit: $timeLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWodModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.boxId, boxId) || other.boxId == boxId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hasTimeLimit, hasTimeLimit) ||
                other.hasTimeLimit == hasTimeLimit) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, boxId, type, date, hasTimeLimit, timeLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateWodModelImplCopyWith<_$CreateWodModelImpl> get copyWith =>
      __$$CreateWodModelImplCopyWithImpl<_$CreateWodModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateWodModelImplToJson(
      this,
    );
  }
}

abstract class _CreateWodModel implements CreateWodModel {
  const factory _CreateWodModel(
      {final String? userId,
      final int? boxId,
      final WodType? type,
      final DateTime? date,
      final bool? hasTimeLimit,
      final String? timeLimit}) = _$CreateWodModelImpl;

  factory _CreateWodModel.fromJson(Map<String, dynamic> json) =
      _$CreateWodModelImpl.fromJson;

  @override
  String? get userId;
  @override
  int? get boxId;
  @override
  WodType? get type;
  @override
  DateTime? get date;
  @override
  bool? get hasTimeLimit;
  @override
  String? get timeLimit;
  @override
  @JsonKey(ignore: true)
  _$$CreateWodModelImplCopyWith<_$CreateWodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
