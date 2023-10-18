import 'datum.dart';

class ChatModel {
  bool? status;
  List<Datum>? data;

  ChatModel({this.status, this.data});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
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
