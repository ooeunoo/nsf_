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
  String? get type => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  int? get timeLimit => throw _privateConstructorUsedError;

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
  $Res call({String? type, DateTime? date, int? timeLimit});
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
    Object? type = freezed,
    Object? date = freezed,
    Object? timeLimit = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call({String? type, DateTime? date, int? timeLimit});
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
    Object? type = freezed,
    Object? date = freezed,
    Object? timeLimit = freezed,
  }) {
    return _then(_$CreateWodModelImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeLimit: freezed == timeLimit
          ? _value.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateWodModelImpl implements _CreateWodModel {
  const _$CreateWodModelImpl({this.type, this.date, this.timeLimit});

  factory _$CreateWodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateWodModelImplFromJson(json);

  @override
  final String? type;
  @override
  final DateTime? date;
  @override
  final int? timeLimit;

  @override
  String toString() {
    return 'CreateWodModel(type: $type, date: $date, timeLimit: $timeLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateWodModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, date, timeLimit);

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
      {final String? type,
      final DateTime? date,
      final int? timeLimit}) = _$CreateWodModelImpl;

  factory _CreateWodModel.fromJson(Map<String, dynamic> json) =
      _$CreateWodModelImpl.fromJson;

  @override
  String? get type;
  @override
  DateTime? get date;
  @override
  int? get timeLimit;
  @override
  @JsonKey(ignore: true)
  _$$CreateWodModelImplCopyWith<_$CreateWodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
