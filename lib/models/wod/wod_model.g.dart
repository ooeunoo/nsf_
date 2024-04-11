// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WodModelImpl _$$WodModelImplFromJson(Map<String, dynamic> json) =>
    _$WodModelImpl(
      id: json['id'] as int,
      userId: json['userId'] as String,
      boxId: json['boxId'] as int,
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$WodTypeEnumMap, json['type']),
      timeLimt: json['timeLimt'] as int?,
      completion: json['completion'] as bool? ?? false,
      completionTime: json['completionTime'] as int?,
      completionLbs: json['completionLbs'] as int?,
    );

Map<String, dynamic> _$$WodModelImplToJson(_$WodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'boxId': instance.boxId,
      'date': instance.date.toIso8601String(),
      'type': _$WodTypeEnumMap[instance.type]!,
      'timeLimt': instance.timeLimt,
      'completion': instance.completion,
      'completionTime': instance.completionTime,
      'completionLbs': instance.completionLbs,
    };

const _$WodTypeEnumMap = {
  WodType.ForTime: 'ForTime',
  WodType.AMRAP: 'AMRAP',
  WodType.EMOM: 'EMOM',
};
