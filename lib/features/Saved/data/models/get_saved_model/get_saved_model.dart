import 'datum.dart';

class GetSavedModel {
  bool? status;
  List<Datum>? data;

  GetSavedModel({this.status, this.data});

  factory GetSavedModel.fromJson(Map<String, dynamic> json) => GetSavedModel(
        status: json['status'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
