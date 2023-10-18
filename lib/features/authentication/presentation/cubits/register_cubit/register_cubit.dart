import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/errors/failures.dart';
import 'package:jobhub/features/authentication/data/models/authentication_model/authentication_model.dart';
import 'package:jobhub/features/authentication/data/models/register_model/register_model.dart';
import 'package:jobhub/features/authentication/data/repository/authentication_repository.dart';
import 'package:jobhub/features/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authenticationRepository) : super(RegisterInitialState());

  final AuthenticationRepository authenticationRepository;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isShowPassword = true;

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    emit(RegisterChangePasswordVisibilityState());
  }

  RegisterModel? registerModel;

  Future<void> userRegister() async {
    emit(RegisterLoadingState());
    Either<Failure, RegisterModel> result;
    result = await authenticationRepository.userRegister(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold((failure) {
      emit(RegisterFailureState(failure.error));
    }, (registerModel) {
      this.registerModel = registerModel;
      emit(RegisterSuccessState(registerModel));
    });
  }
}
