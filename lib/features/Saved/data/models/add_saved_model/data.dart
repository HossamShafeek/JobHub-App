import 'job.dart';
import 'user.dart';

class Data {
  User? user;
  Job? job;

  Data({this.user, this.job});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        job: json['job'] == null
            ? null
            : Job.fromJson(json['job'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'job': job?.toJson(),
      };
}
