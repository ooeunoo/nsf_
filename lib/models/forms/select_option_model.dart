// To parse this JSON data, do
//
//     final selectOptionModel = selectOptionModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

SelectOptionModel selectOptionModelFromJson(String str) =>
    SelectOptionModel.fromJson(json.decode(str));

String selectOptionModelToJson(SelectOptionModel data) =>
    json.encode(data.toJson());

class SelectOptionModel {
  String title;
  String? subTitle;
  dynamic value;
  dynamic groupValue;
  Widget? expandWidget;

  SelectOptionModel(
      {required this.title,
      this.subTitle,
      required this.value,
      required this.groupValue,
      this.expandWidget});

  factory SelectOptionModel.fromJson(Map<String, dynamic> json) =>
      SelectOptionModel(
          title: json["title"],
          subTitle: json["subTitle"],
          value: json["value"],
          groupValue: json["groupValue"],
          expandWidget: json['expandWidget']);

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "value": value,
        "groupValue": groupValue,
        'expandWidget': expandWidget
      };
}
