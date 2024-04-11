// To parse this JSON data, do
//
//     final createWodModel = createWodModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:nsf/models/wod/wod_model.dart';

part 'update_wod_model.freezed.dart';
part 'update_wod_model.g.dart';

UpdateWodModel updateWodModelFromJson(String str) =>
    UpdateWodModel.fromJson(json.decode(str));

String updateWodModelToJson(UpdateWodModel data) => json.encode(data.toJson());

@freezed
class UpdateWodModel with _$UpdateWodModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UpdateWodModel({
    String? id,
    bool? completion,
    int? completionTime,
    int? completionLbs,
  }) = _UpdateWodModel;

  factory UpdateWodModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateWodModelFromJson(json);
}
