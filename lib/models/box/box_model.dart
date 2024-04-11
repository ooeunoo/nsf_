// To parse this JSON data, do
//
//     final boxModel = boxModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'box_model.freezed.dart';
part 'box_model.g.dart';

@freezed
class BoxModel with _$BoxModel {
  const factory BoxModel({
    required int id,
    required String name,
    required String address,
  }) = _BoxModel;

  factory BoxModel.fromJson(Map<String, dynamic> json) =>
      _$BoxModelFromJson(json);
}

BoxModel boxModelFromJson(String str) => BoxModel.fromJson(json.decode(str));

String boxModelToJson(BoxModel data) => json.encode(data.toJson());
