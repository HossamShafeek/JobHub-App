import 'data.dart';

class AddSavedModel {
  bool? status;
  Data? data;

  AddSavedModel({this.status, this.data});

  factory AddSavedModel.fromJson(Map<String, dynamic> json) => AddSavedModel(
        status: json['status'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
