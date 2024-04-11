// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_wod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateWodModelImpl _$$UpdateWodModelImplFromJson(Map<String, dynamic> json) =>
    _$UpdateWodModelImpl(
      id: json['id'] as String?,
      completion: json['completion'] as bool?,
      completionTime: json['completion_time'] as int?,
      completionLbs: json['completion_lbs'] as int?,
    );

Map<String, dynamic> _$$UpdateWodModelImplToJson(
        _$UpdateWodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'completion': instance.completion,
      'completion_time': instance.completionTime,
      'completion_lbs': instance.completionLbs,
    };
