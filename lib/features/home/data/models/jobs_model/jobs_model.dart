import 'job.dart';

class JobsModel {
  bool? status;
  List<Job>? data;

  JobsModel({this.status, this.data});

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        status: json['status'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
