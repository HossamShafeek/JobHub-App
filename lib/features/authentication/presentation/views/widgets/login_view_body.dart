import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/local/cache_helper.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/functions/show_snack_bar.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/gradient_button.dart';
import 'package:jobhub/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:jobhub/features/authentication/presentation/cubits/login_cubit/login_state.dart';
import 'package:jobhub/features/authentication/presentation/views/widgets/login_texts_fields_section.dart';
import 'package:jobhub/features/authentication/presentation/views/widgets/nanigate_to_login_or_register.dart';
import 'package:jobhub/features/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.setString(
            key: 'token',
            value: state.authenticationModel.token!,
          );
          CacheHelper.setString(
            key: 'userId',
            value: state.authenticationModel.user!.id.toString(),
          );
          AppConstants.userId = state.authenticationModel.user!.id.toString();
          AppConstants.token = state.authenticationModel.token!;
          Navigator.pushReplacementNamed(context, Routes.layoutView);
          showSuccessSnackBar(context: context, message: 'Logged in successfully');
        } else if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleAndSubtitle(
                    subtitle: AppStrings.signInSubtitle,
                    title: AppStrings.signIn,
                  ),
                  const LoginTextsFieldsSection(),
                  GradientButton(
                    onPressed: () {
                      if (LoginCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        LoginCubit.get(context).userLogin();
                      }
                    },
                    title: Text(
                      AppStrings.signIn,
                      style: AppStyles.textStyle18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  NavigateToLoginOrRegister(
                    textTitle: AppStrings.alreadyHaveAnAccount,
                    buttonTitle: AppStrings.signUp,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerView);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
