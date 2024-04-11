// To parse this JSON data, do
//
//     final selectOptionModel = selectOptionModelFromJson(jsonString);

import 'dart:convert';

SelectOptionModel selectOptionModelFromJson(String str) =>
    SelectOptionModel.fromJson(json.decode(str));

String selectOptionModelToJson(SelectOptionModel data) =>
    json.encode(data.toJson());

class SelectOptionModel {
  String title;
  String? subTitle;
  String value;
  String groupValue;

  SelectOptionModel({
    required this.title,
    this.subTitle,
    required this.value,
    required this.groupValue,
  });

  factory SelectOptionModel.fromJson(Map<String, dynamic> json) =>
      SelectOptionModel(
        title: json["title"],
        subTitle: json["subTitle"],
        value: json["value"],
        groupValue: json["groupValue"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "value": value,
        "groupValue": groupValue,
      };
}
