
import 'dart:convert';

List<MultipleDateDataModel> multipleDateDataModelFromJson(String str) =>
    List<MultipleDateDataModel>.from(
        json.decode(str).map((x) => MultipleDateDataModel.fromJson(x)));

String multipleDateDataModelToJson(List<MultipleDateDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MultipleDateDataModel {
  final int hrd;
  final int tech;
  final int followup;
  final int total;

  MultipleDateDataModel({
    required this.hrd,
    required this.tech,
    required this.followup,
    required this.total,
  });

  factory MultipleDateDataModel.fromJson(Map<String, dynamic> json) =>
      MultipleDateDataModel(
        hrd: json["hrd"],
        tech: json["tech"],
        followup: json["followup"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "hrd": hrd,
        "tech": tech,
        "followup": followup,
        "total": total,
      };
}
