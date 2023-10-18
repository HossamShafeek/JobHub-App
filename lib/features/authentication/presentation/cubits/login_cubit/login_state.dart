import 'package:jobhub/features/authentication/data/models/authentication_model/authentication_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthenticationModel authenticationModel;

  LoginSuccessState(this.authenticationModel);
}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginState {}

class LoginChangeKeepMeLoggedInState extends LoginState {}
