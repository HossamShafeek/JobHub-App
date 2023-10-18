import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/api/api_services_implementation.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/profile/data/repositry/profile_repository_implementation.dart';
import 'package:jobhub/features/profile/presentation/cubits/update_user_profile_cubit/update_user_profile_cubit.dart';

void showUpdateProfileBottomSheet(
    {required BuildContext context, required Widget content}) {
  showModalBottomSheet(
    backgroundColor: AppColors.transparent,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.radius25r),
        topRight: Radius.circular(AppConstants.radius25r),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    builder: (context) {
      return BlocProvider(
          create: (context) => UpdateUserProfileCubit(
              ProfileRepositoryImplementation(ApiServicesImplementation())),
          child: content);
    },
  );
}
