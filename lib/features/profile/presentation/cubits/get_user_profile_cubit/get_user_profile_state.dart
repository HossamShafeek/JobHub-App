import 'package:jobhub/features/profile/data/models/profile_model/profile_model.dart';

abstract class GetUserProfileState {}

class GetUserProfileInitialState extends GetUserProfileState {}

class GetUserProfileLoadingState extends GetUserProfileState {}

class GetUserProfileSuccessState extends GetUserProfileState {
  final ProfileModel profileModel;

  GetUserProfileSuccessState(this.profileModel);
}

class GetUserProfileFailureState extends GetUserProfileState {
  final String error;

  GetUserProfileFailureState(this.error);
}
