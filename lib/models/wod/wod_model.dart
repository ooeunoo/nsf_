// To parse this JSON data, do
//
//     final wodModel = wodModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nsf/models/box/box_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'dart:convert';

import 'package:nsf/utils/time.dart';

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
  const WodModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory WodModel({
    required int id,
    required String userId,
    required int boxId,
    required DateTime date,
    required WodType type,
    @Default(0) int? timeLimit,
    @Default(false) bool completion,
    @Default(null) int? completionTime,
    @Default(null) int? completionLbs,
  }) = _WodModel;

  factory WodModel.fromJson(Map<String, dynamic> json) =>
      _$WodModelFromJson(json);

  String get getPurposeInformation => switch (type) {
        WodType.ForTime => timeLimit == null
            ? type.name
            : '${type.name} • ${secondToMinute(timeLimit!)}분 이내',
        WodType.AMRAP => '${type.name} • ${secondToMinute(timeLimit!)}분 이내',
        WodType.EMOM => '${type.name} • ${secondToMinute(timeLimit!)}분 이내'
      };

  bool get successTimeLimit => timeLimit! > completionTime!;
}

WodModel wodModelFromJson(String str) => WodModel.fromJson(json.decode(str));

String wodModelToJson(WodModel data) => json.encode(data.toJson());
