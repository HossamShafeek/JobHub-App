import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/profile/data/models/profile_model/profile_model.dart';
import 'package:jobhub/features/profile/data/repositry/profile_repository.dart';
import 'package:jobhub/features/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit(this.profileRepository)
      : super(UpdateUserProfileInitialState());

  final ProfileRepository profileRepository;

  static UpdateUserProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKeyForUpdateName = GlobalKey<FormState>();
  var formKeyForUpdatePassword = GlobalKey<FormState>();

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(ChangePasswordVisibilityState());
  }

  Future<void> updateUserName() async {
    emit(UpdateUserProfileLoadingState());
    Either<Failure, ProfileModel> result;
    result = await profileRepository.updateUserName(name: nameController.text);
    result.fold((failure) {
      emit(UpdateUserProfileFailureState(failure.error));
    }, (profileModel) {
      emit(UpdateUserProfileSuccessState(profileModel));
    });
  }

  Future<void> updatePassword() async {
    emit(UpdateUserProfileLoadingState());
    Either<Failure, ProfileModel> result;
    result = await profileRepository.updatePassword(
        password: passwordController.text);
    result.fold((failure) {
      emit(UpdateUserProfileFailureState(failure.error));
    }, (profileModel) {
      emit(UpdateUserProfileSuccessState(profileModel));
    });
  }
}
