import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_container_button.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_state.dart';

class UploadedCvWidget extends StatelessWidget {
  const UploadedCvWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyJobCubit,ApplyJobState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.all(AppConstants.padding8h),
        margin: EdgeInsets.only(top: AppConstants.padding10h),
        decoration: BoxDecoration(
            color: AppColors.grey50,
            borderRadius: BorderRadius.circular(AppConstants.radius8r)),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.pdf,
              height: AppConstants.padding40h,
            ),
            SizedBox(width: AppConstants.padding3w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ApplyJobCubit.get(context).fileName!,
                    style: AppStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: AppConstants.padding2h),
                  Text(
                    '${(ApplyJobCubit.get(context).pickedFile!.files.single.size / 1024 / 1024).toStringAsFixed(2)} MB',
                    style: AppStyles.textStyle14,
                  ),
                ],
              ),
            ),
            CustomContainerButton(
              onTap: () {
                ApplyJobCubit.get(context).pickFile();
              },
              icon: IconBroken.Edit,
              color: AppColors.primary,
            )
          ],
        ),
      );
    },);
  }
}
