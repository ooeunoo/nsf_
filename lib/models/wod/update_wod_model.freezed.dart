// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_wod_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateWodModel _$UpdateWodModelFromJson(Map<String, dynamic> json) {
  return _UpdateWodModel.fromJson(json);
}

/// @nodoc
mixin _$UpdateWodModel {
  String? get id => throw _privateConstructorUsedError;
  bool? get completion => throw _privateConstructorUsedError;
  int? get completionTime => throw _privateConstructorUsedError;
  int? get completionLbs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateWodModelCopyWith<UpdateWodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateWodModelCopyWith<$Res> {
  factory $UpdateWodModelCopyWith(
          UpdateWodModel value, $Res Function(UpdateWodModel) then) =
      _$UpdateWodModelCopyWithImpl<$Res, UpdateWodModel>;
  @useResult
  $Res call(
      {String? id, bool? completion, int? completionTime, int? completionLbs});
}

/// @nodoc
class _$UpdateWodModelCopyWithImpl<$Res, $Val extends UpdateWodModel>
    implements $UpdateWodModelCopyWith<$Res> {
  _$UpdateWodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? completion = freezed,
    Object? completionTime = freezed,
    Object? completionLbs = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      completion: freezed == completion
          ? _value.completion
          : completion // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$UpdateWodModelImplCopyWith<$Res>
    implements $UpdateWodModelCopyWith<$Res> {
  factory _$$UpdateWodModelImplCopyWith(_$UpdateWodModelImpl value,
          $Res Function(_$UpdateWodModelImpl) then) =
      __$$UpdateWodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, bool? completion, int? completionTime, int? completionLbs});
}

/// @nodoc
class __$$UpdateWodModelImplCopyWithImpl<$Res>
    extends _$UpdateWodModelCopyWithImpl<$Res, _$UpdateWodModelImpl>
    implements _$$UpdateWodModelImplCopyWith<$Res> {
  __$$UpdateWodModelImplCopyWithImpl(
      _$UpdateWodModelImpl _value, $Res Function(_$UpdateWodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? completion = freezed,
    Object? completionTime = freezed,
    Object? completionLbs = freezed,
  }) {
    return _then(_$UpdateWodModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      completion: freezed == completion
          ? _value.completion
          : completion // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$UpdateWodModelImpl implements _UpdateWodModel {
  const _$UpdateWodModelImpl(
      {this.id, this.completion, this.completionTime, this.completionLbs});

  factory _$UpdateWodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateWodModelImplFromJson(json);

  @override
  final String? id;
  @override
  final bool? completion;
  @override
  final int? completionTime;
  @override
  final int? completionLbs;

  @override
  String toString() {
    return 'UpdateWodModel(id: $id, completion: $completion, completionTime: $completionTime, completionLbs: $completionLbs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateWodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.completion, completion) ||
                other.completion == completion) &&
            (identical(other.completionTime, completionTime) ||
                other.completionTime == completionTime) &&
            (identical(other.completionLbs, completionLbs) ||
                other.completionLbs == completionLbs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, completion, completionTime, completionLbs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateWodModelImplCopyWith<_$UpdateWodModelImpl> get copyWith =>
      __$$UpdateWodModelImplCopyWithImpl<_$UpdateWodModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateWodModelImplToJson(
      this,
    );
  }
}

abstract class _UpdateWodModel implements UpdateWodModel {
  const factory _UpdateWodModel(
      {final String? id,
      final bool? completion,
      final int? completionTime,
      final int? completionLbs}) = _$UpdateWodModelImpl;

  factory _UpdateWodModel.fromJson(Map<String, dynamic> json) =
      _$UpdateWodModelImpl.fromJson;

  @override
  String? get id;
  @override
  bool? get completion;
  @override
  int? get completionTime;
  @override
  int? get completionLbs;
  @override
  @JsonKey(ignore: true)
  _$$UpdateWodModelImplCopyWith<_$UpdateWodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
