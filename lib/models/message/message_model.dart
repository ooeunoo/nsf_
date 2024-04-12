// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nsf/models/box/box_model.dart';
import 'dart:convert';

import 'package:nsf/models/user/user_model.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

@freezed
class MessageModel with _$MessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MessageModel({
    required int id,
    required String userId,
    required int boxId,
    required String content,
    required DateTime createdAt,
    required bool isMine,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
