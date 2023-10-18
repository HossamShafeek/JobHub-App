import 'apply.dart';

class ApplyModel {
  bool? status;
  List<Apply>? apply;

  ApplyModel({this.status, this.apply});

  factory ApplyModel.fromJson(Map<String, dynamic> json) => ApplyModel(
        status: json['status'] as bool?,
        apply: (json['data'] as List<dynamic>?)
            ?.map((e) => Apply.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': apply?.map((e) => e.toJson()).toList(),
      };
}
