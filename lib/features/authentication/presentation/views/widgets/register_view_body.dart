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
import 'package:jobhub/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:jobhub/features/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:jobhub/features/authentication/presentation/views/widgets/nanigate_to_login_or_register.dart';
import 'package:jobhub/features/authentication/presentation/views/widgets/register_texts_fields_section.dart';
import 'package:jobhub/features/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CacheHelper.setString(
            key: 'token',
            value: state.authenticationModel.token!,
          );
          CacheHelper.setString(
            key: 'userId',
            value: state.authenticationModel.data!.id.toString(),
          );
          AppConstants.userId = state.authenticationModel.data!.id.toString();
          AppConstants.token = state.authenticationModel.token!;
          Navigator.pushNamedAndRemoveUntil(context, Routes.layoutView, (route) => false);
          showSuccessSnackBar(context: context, message: 'Logged in successfully');
        } else if (state is RegisterFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoadingState,
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
                    subtitle: AppStrings.signUpSubtitle,
                    title: AppStrings.signUp,
                  ),
                  const RegisterTextsFieldsSection(),
                  GradientButton(
                    title: Text(
                      AppStrings.signUp,
                      style: AppStyles.textStyle18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    onPressed: () {
                      if (RegisterCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        RegisterCubit.get(context).userRegister();
                      }
                    },
                  ),
                  NavigateToLoginOrRegister(
                    textTitle: AppStrings.dontHaveAnAccount,
                    buttonTitle: AppStrings.signIn,
                    onPressed: () {
                      Navigator.pop(context);
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
