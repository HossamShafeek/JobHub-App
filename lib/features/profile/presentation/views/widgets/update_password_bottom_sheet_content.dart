import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/functions/show_snack_bar.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_text_field.dart';
import 'package:jobhub/core/widgets/gradient_button.dart';
import 'package:jobhub/features/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:jobhub/features/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:jobhub/features/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdatePasswordBottomSheetContent extends StatelessWidget {
  const UpdatePasswordBottomSheetContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserProfileCubit, UpdateUserProfileState>(
      listener: (context, state) {
        if (state is UpdateUserProfileSuccessState) {
          showSuccessSnackBar(
              context: context, message: 'Password updated successfully');
          Navigator.pop(context);
        } else if (state is UpdateUserProfileFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateUserProfileLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            color: AppColors.white,
            child: Form(
              key: UpdateUserProfileCubit.get(context).formKeyForUpdateName,
              child: Column(
                children: [
                  Text(
                    AppStrings.updatePassword,
                    style: AppStyles.textStyle18.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextField(
                    textInputType: TextInputType.visiblePassword,
                    controller:
                        UpdateUserProfileCubit.get(context).passwordController,
                    obscureText:
                        UpdateUserProfileCubit.get(context).isShowPassword,
                    prefixIcon: const Icon(IconBroken.Lock),
                    paddingForBottom: AppConstants.padding20h,
                    suffixIcon: InkWell(
                      onTap: () {
                        UpdateUserProfileCubit.get(context)
                            .changePasswordVisibility();
                      },
                      child: Icon(
                        UpdateUserProfileCubit.get(context).isShowPassword
                            ? IconBroken.Hide
                            : IconBroken.Show,
                        color: AppColors.grey,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password is too short';
                      }
                      return null;
                    },
                    title: 'Password',
                    hintText: 'Enter your password',
                  ),
                  GradientButton(
                    title: Text(
                      AppStrings.update,
                      style: AppStyles.textStyle18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    onPressed: () {
                      if (UpdateUserProfileCubit.get(context)
                          .formKeyForUpdateName
                          .currentState!
                          .validate()) {
                        UpdateUserProfileCubit.get(context).updatePassword();
                      }
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
