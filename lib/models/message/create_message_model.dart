// To parse this JSON data, do
//
//     final createMessageModel = createMessageModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_message_model.freezed.dart';
part 'create_message_model.g.dart';

CreateMessageModel createMessageModelFromJson(String str) =>
    CreateMessageModel.fromJson(json.decode(str));

String createMessageModelToJson(CreateMessageModel data) =>
    json.encode(data.toJson());

@freezed
class CreateMessageModel with _$CreateMessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CreateMessageModel({
    required String userId,
    required int boxId,
    required String content,
  }) = _CreateMessageModel;

  factory CreateMessageModel.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageModelFromJson(json);
}
