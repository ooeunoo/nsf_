// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateMessageModelImpl _$$CreateMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateMessageModelImpl(
      userId: json['user_id'] as String,
      boxId: json['box_id'] as int,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$CreateMessageModelImplToJson(
        _$CreateMessageModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'box_id': instance.boxId,
      'content': instance.content,
    };
