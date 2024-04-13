// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wod_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WodModel _$WodModelFromJson(Map<String, dynamic> json) {
  return _WodModel.fromJson(json);
}

/// @nodoc
mixin _$WodModel {
  int get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get boxId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  WodType get type => throw _privateConstructorUsedError;
  int? get timeLimit => throw _privateConstructorUsedError;
  bool get completion => throw _privateConstructorUsedError;
  int? get completionTime => throw _privateConstructorUsedError;
  int? get completionLbs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WodModelCopyWith<WodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WodModelCopyWith<$Res> {
  factory $WodModelCopyWith(WodModel value, $Res Function(WodModel) then) =
      _$WodModelCopyWithImpl<$Res, WodModel>;
  @useResult
  $Res call(
      {int id,
      String userId,
      int boxId,
      DateTime date,
      WodType type,
      int? timeLimit,
      bool completion,
      int? completionTime,
      int? completionLbs});
}

/// @nodoc
class _$WodModelCopyWithImpl<$Res, $Val extends WodModel>
    implements $WodModelCopyWith<$Res> {
  _$WodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? boxId = null,
    Object? date = null,
    Object? type = null,
    Object? timeLimit = freezed,
    Object? completion = null,
    Object? completionTime = freezed,
    Object? completionLbs = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WodType,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      completion: null == completion
          ? _value.completion
          : completion // ignore: cast_nullable_to_non_nullable
              as bool,
      completionTime: freezed == completionTime
          ? _value.completionTime
          : completionTime // ignore: cast_nullable_to_non_nullable
              as int?,
      completionLbs: freezed == completionLbs
          ? _value.completionLbs
          : completionLbs // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WodModelImplCopyWith<$Res>
    implements $WodModelCopyWith<$Res> {
  factory _$$WodModelImplCopyWith(
          _$WodModelImpl value, $Res Function(_$WodModelImpl) then) =
      __$$WodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String userId,
      int boxId,
      DateTime date,
      WodType type,
      int? timeLimit,
      bool completion,
      int? completionTime,
      int? completionLbs});
}

/// @nodoc
class __$$WodModelImplCopyWithImpl<$Res>
    extends _$WodModelCopyWithImpl<$Res, _$WodModelImpl>
    implements _$$WodModelImplCopyWith<$Res> {
  __$$WodModelImplCopyWithImpl(
      _$WodModelImpl _value, $Res Function(_$WodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? boxId = null,
    Object? date = null,
    Object? type = null,
    Object? timeLimit = freezed,
    Object? completion = null,
    Object? completionTime = freezed,
    Object? completionLbs = freezed,
  }) {
    return _then(_$WodModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WodType,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      completion: null == completion
          ? _value.completion
          : completion // ignore: cast_nullable_to_non_nullable
              as bool,
      completionTime: freezed == completionTime
          ? _value.completionTime
          : completionTime // ignore: cast_nullable_to_non_nullable
              as int?,
      completionLbs: freezed == completionLbs
          ? _value.completionLbs
          : completionLbs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$WodModelImpl extends _WodModel {
  const _$WodModelImpl(
      {required this.id,
      required this.userId,
      required this.boxId,
      required this.date,
      required this.type,
      this.timeLimit = 0,
      this.completion = false,
      this.completionTime = null,
      this.completionLbs = null})
      : super._();

  factory _$WodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WodModelImplFromJson(json);

  @override
  final int id;
  @override
  final String userId;
  @override
  final int boxId;
  @override
  final DateTime date;
  @override
  final WodType type;
  @override
  @JsonKey()
  final int? timeLimit;
  @override
  @JsonKey()
  final bool completion;
  @override
  @JsonKey()
  final int? completionTime;
  @override
  @JsonKey()
  final int? completionLbs;

  @override
  String toString() {
    return 'WodModel(id: $id, userId: $userId, boxId: $boxId, date: $date, type: $type, timeLimit: $timeLimit, completion: $completion, completionTime: $completionTime, completionLbs: $completionLbs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.boxId, boxId) || other.boxId == boxId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.completion, completion) ||
                other.completion == completion) &&
            (identical(other.completionTime, completionTime) ||
                other.completionTime == completionTime) &&
            (identical(other.completionLbs, completionLbs) ||
                other.completionLbs == completionLbs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, boxId, date, type,
      timeLimit, completion, completionTime, completionLbs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WodModelImplCopyWith<_$WodModelImpl> get copyWith =>
      __$$WodModelImplCopyWithImpl<_$WodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WodModelImplToJson(
      this,
    );
  }
}

abstract class _WodModel extends WodModel {
  const factory _WodModel(
      {required final int id,
      required final String userId,
      required final int boxId,
      required final DateTime date,
      required final WodType type,
      final int? timeLimit,
      final bool completion,
      final int? completionTime,
      final int? completionLbs}) = _$WodModelImpl;
  const _WodModel._() : super._();

  factory _WodModel.fromJson(Map<String, dynamic> json) =
      _$WodModelImpl.fromJson;

  @override
  int get id;
  @override
  String get userId;
  @override
  int get boxId;
  @override
  DateTime get date;
  @override
  WodType get type;
  @override
  int? get timeLimit;
  @override
  bool get completion;
  @override
  int? get completionTime;
  @override
  int? get completionLbs;
  @override
  @JsonKey(ignore: true)
  _$$WodModelImplCopyWith<_$WodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
