import 'data.dart';

class SendMessageModel {
  bool? status;
  Data? data;

  SendMessageModel({this.status, this.data});

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
      };
}
