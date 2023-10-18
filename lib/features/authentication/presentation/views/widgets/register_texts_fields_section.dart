import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/widgets/custom_text_field.dart';
import 'package:jobhub/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:jobhub/features/authentication/presentation/cubits/register_cubit/register_state.dart';

class RegisterTextsFieldsSection extends StatelessWidget {
  const RegisterTextsFieldsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.name,
                controller: RegisterCubit.get(context).nameController,
                prefixIcon: const Icon(IconBroken.Profile),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                title: 'Name',
                hintText: 'Enter your name',
              ),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: RegisterCubit.get(context).emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                title: 'Email',
                hintText: 'Enter your email',
              ),
              CustomTextField(
                textInputType: TextInputType.visiblePassword,
                controller: RegisterCubit.get(context).passwordController,
                obscureText: RegisterCubit.get(context).isShowPassword,
                prefixIcon: const Icon(IconBroken.Lock),
                paddingForBottom: AppConstants.padding20h,
                suffixIcon: InkWell(
                  onTap: () {
                    RegisterCubit.get(context).changePasswordVisibility();
                  },
                  child: Icon(
                    RegisterCubit.get(context).isShowPassword
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
            ],
          ),
        );
      },
    );
  }
}
