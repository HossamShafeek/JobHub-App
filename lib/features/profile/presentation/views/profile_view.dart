import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/shimmer/shimmer_profile_view.dart';
import 'package:jobhub/core/widgets/custom_error_widget.dart';
import 'package:jobhub/features/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_cubit.dart';
import 'package:jobhub/features/profile/presentation/cubits/get_user_profile_cubit/get_user_profile_state.dart';
import 'package:jobhub/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfileCubit, GetUserProfileState>(
      builder: (context, state) {
        if (state is GetUserProfileSuccessState) {
          return ProfileViewBody(profileModel: state.profileModel);
        } else if (state is GetUserProfileFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerProfileView();
        }
      },
    );
  }
}
