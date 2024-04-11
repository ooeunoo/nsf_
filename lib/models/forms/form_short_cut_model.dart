// To parse this JSON data, do
//
//     final formShortCutModel = formShortCutModelFromJson(jsonString);

import 'dart:convert';

FormShortCutModel formShortCutModelFromJson(String str) =>
    FormShortCutModel.fromJson(json.decode(str));

String formShortCutModelToJson(FormShortCutModel data) =>
    json.encode(data.toJson());

class FormShortCutModel {
  String name;
  void Function() action;

  FormShortCutModel({
    required this.name,
    required this.action,
  });

  factory FormShortCutModel.fromJson(Map<String, dynamic> json) =>
      FormShortCutModel(
        name: json["name"],
        action: json["action"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "action": action,
      };
}
