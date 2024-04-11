// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_wod_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateWodModelImpl _$$CreateWodModelImplFromJson(Map<String, dynamic> json) =>
    _$CreateWodModelImpl(
      type: json['type'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      timeLimit: json['timeLimit'] as int?,
    );

Map<String, dynamic> _$$CreateWodModelImplToJson(
        _$CreateWodModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'date': instance.date?.toIso8601String(),
      'timeLimit': instance.timeLimit,
    };
