import 'data.dart';

class ProfileModel {
  Data? data;
  bool? status;

  ProfileModel({this.data, this.status});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'status': status,
      };
}
