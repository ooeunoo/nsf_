// To parse this JSON data, do
//
//     final wodModel = wodModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'wod_model.freezed.dart';
part 'wod_model.g.dart';

enum WodType {
  ForTime('주어진 운동을 최대한 빠르게 수행'),
  AMRAP('주어진 시간 안에 가능한 많은 라운드 수행'),
  EMOM('1분 단위로 주어진 운동을 수행');

  const WodType(this.description);
  final String description;
}

@freezed
class WodModel with _$WodModel {
  const factory WodModel({
    required int id,
    required String userId,
    required int boxId,
    required DateTime date,
    required WodType type,
    int? timeLimt,
    @Default(false) bool completion,
    int? completionTime,
    int? completionLbs,
  }) = _WodModel;

  factory WodModel.fromJson(Map<String, dynamic> json) =>
      _$WodModelFromJson(json);
}

WodModel wodModelFromJson(String str) => WodModel.fromJson(json.decode(str));

String wodModelToJson(WodModel data) => json.encode(data.toJson());
