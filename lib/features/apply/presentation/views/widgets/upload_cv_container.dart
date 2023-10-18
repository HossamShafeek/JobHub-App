import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/upload_cv_button.dart';

class UploadCvContainer extends StatelessWidget {
  const UploadCvContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      margin: EdgeInsets.only(top: AppConstants.padding10h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radius10r),
        color: AppColors.primary.withOpacity(0.15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.upload,
            height: AppConstants.padding50h,
          ),
          SizedBox(
            height: AppConstants.padding5h,
          ),
          Text(
            'Upload your other file',
            style: AppStyles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppConstants.padding8h),
            child: Text(
              'Max. file size 1 MB',
              style: AppStyles.textStyle14,
            ),
          ),
          const UploadCvButton(),
        ],
      ),
    );
  }
}
