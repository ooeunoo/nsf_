// To parse this JSON data, do
//
//     final createWodModel = createWodModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:nsf/models/wod/wod_model.dart';

part 'create_wod_model.freezed.dart';
part 'create_wod_model.g.dart';

CreateWodModel createWodModelFromJson(String str) =>
    CreateWodModel.fromJson(json.decode(str));

String createWodModelToJson(CreateWodModel data) => json.encode(data.toJson());

@freezed
class CreateWodModel with _$CreateWodModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CreateWodModel({
    String? userId,
    int? boxId,
    WodType? type,
    DateTime? date,
    bool? hasTimeLimit,
    String? timeLimit,
  }) = _CreateWodModel;

  factory CreateWodModel.fromJson(Map<String, dynamic> json) =>
      _$CreateWodModelFromJson(json);
}
