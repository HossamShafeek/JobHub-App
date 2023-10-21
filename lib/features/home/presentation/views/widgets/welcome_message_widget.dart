import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/shimmer/shimmer_welcome_message.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_error_widget.dart';
import 'package:jobhub/features/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:jobhub/features/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_state.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        if (state is GetUserProfileSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${state.profileModel.data!.name!}👋',
                style: AppStyles.textStyle22,
              ),
              Text(
                AppStrings.welcomeMessage,
                style: AppStyles.textStyle15,
              ),
            ],
          );
        } else if (state is GetUserProfileFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerWelcomeMessage();
        }
      },
    );
  }
}
