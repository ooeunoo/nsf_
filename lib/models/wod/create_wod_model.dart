// To parse this JSON data, do
//
//     final createWodModel = createWodModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'create_wod_model.freezed.dart';
part 'create_wod_model.g.dart';

CreateWodModel createWodModelFromJson(String str) =>
    CreateWodModel.fromJson(json.decode(str));

String createWodModelToJson(CreateWodModel data) => json.encode(data.toJson());

@freezed
class CreateWodModel with _$CreateWodModel {
  const factory CreateWodModel({
    required String type,
    required DateTime date,
    required int timeLimit,
  }) = _CreateWodModel;

  factory CreateWodModel.fromJson(Map<String, dynamic> json) =>
      _$CreateWodModelFromJson(json);
}
