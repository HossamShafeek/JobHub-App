import 'user.dart';

class AuthenticationModel {
  User? user;
  String? token;
  bool? status;

  AuthenticationModel({this.user, this.token, this.status});

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      status: json['status'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'token': token,
        'status': status,
      };
}
