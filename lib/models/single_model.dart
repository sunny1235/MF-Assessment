
import 'dart:convert';

List<SingleDateDataModel> singleDateDataModelFromJson(String str) =>
    List<SingleDateDataModel>.from(
        json.decode(str).map((x) => SingleDateDataModel.fromJson(x)));

String singleDateDataModelToJson(List<SingleDateDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleDateDataModel {
  final String name;
  final String id;
  final String offered;
  final String current;
  final String priority;
  final int level;

  SingleDateDataModel({
    required this.name,
    required this.id,
    required this.offered,
    required this.current,
    required this.priority,
    required this.level,
  });

  factory SingleDateDataModel.fromJson(Map<String, dynamic> json) =>
      SingleDateDataModel(
        name: json["name"],
        id: json["id"],
        offered: json["offered"],
        current: json["current"],
        priority: json["priority"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "offered": offered,
        "current": current,
        "priority": priority,
        "level": level,
      };
}
