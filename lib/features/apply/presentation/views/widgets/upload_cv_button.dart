import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';

class UploadCvButton extends StatelessWidget {
  const UploadCvButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 35.h,
      onPressed: () {
        ApplyJobCubit.get(context).pickFile();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius8r),
        side: const BorderSide(color: AppColors.primary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Icon(
              IconBroken.Logout,
              color: AppColors.primary,
              size: AppConstants.iconSize22,
            ),
          ),
          SizedBox(
            width: AppConstants.padding5w,
          ),
          Text(
            'Add File',
            style: AppStyles.textStyle16.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
