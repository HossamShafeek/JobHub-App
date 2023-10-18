import 'data.dart';
import 'profile.dart';

class RegisterModel {
  bool? status;
  Data? data;
  Profile? profile;
  String? token;

  RegisterModel({this.status, this.data, this.profile, this.token});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json['status'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        profile: json['profile'] == null
            ? null
            : Profile.fromJson(json['profile'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.toJson(),
        'profile': profile?.toJson(),
        'token': token,
      };
}
