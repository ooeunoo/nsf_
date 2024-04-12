// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WodModelImpl _$$WodModelImplFromJson(Map<String, dynamic> json) =>
    _$WodModelImpl(
      id: json['id'] as int,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      box: BoxModel.fromJson(json['box'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$WodTypeEnumMap, json['type']),
      timeLimit: json['time_limit'] as int? ?? 0,
      completion: json['completion'] as bool? ?? false,
      completionTime: json['completion_time'] as int? ?? null,
      completionLbs: json['completion_lbs'] as int? ?? null,
    );

Map<String, dynamic> _$$WodModelImplToJson(_$WodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'box': instance.box,
      'date': instance.date.toIso8601String(),
      'type': _$WodTypeEnumMap[instance.type]!,
      'time_limit': instance.timeLimit,
      'completion': instance.completion,
      'completion_time': instance.completionTime,
      'completion_lbs': instance.completionLbs,
    };

const _$WodTypeEnumMap = {
  WodType.ForTime: 'ForTime',
  WodType.AMRAP: 'AMRAP',
  WodType.EMOM: 'EMOM',
};
