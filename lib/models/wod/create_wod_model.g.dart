// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateWodModelImpl _$$CreateWodModelImplFromJson(Map<String, dynamic> json) =>
    _$CreateWodModelImpl(
      userId: json['user_id'] as String?,
      boxId: json['box_id'] as int?,
      type: $enumDecodeNullable(_$WodTypeEnumMap, json['type']),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      hasTimeLimit: json['has_time_limit'] as bool?,
      timeLimit: json['time_limit'] as String?,
    );

Map<String, dynamic> _$$CreateWodModelImplToJson(
        _$CreateWodModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'box_id': instance.boxId,
      'type': _$WodTypeEnumMap[instance.type],
      'date': instance.date?.toIso8601String(),
      'has_time_limit': instance.hasTimeLimit,
      'time_limit': instance.timeLimit,
    };

const _$WodTypeEnumMap = {
  WodType.ForTime: 'ForTime',
  WodType.AMRAP: 'AMRAP',
  WodType.EMOM: 'EMOM',
};
