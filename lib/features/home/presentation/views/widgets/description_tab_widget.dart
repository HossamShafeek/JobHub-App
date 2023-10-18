import 'package:flutter/cupertino.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';

class DescriptionTabWidget extends StatelessWidget {
  const DescriptionTabWidget({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: AppConstants.padding10h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.jobDescription,
            style: AppStyles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: AppConstants.padding8h,
          ),
          Text(
            job.jobDescription!,
            style: AppStyles.textStyle15.copyWith(
              color: AppColors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppConstants.padding8h),
            child: Text(
              AppStrings.jobSkills,
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            job.jobSkill!,
            style: AppStyles.textStyle15.copyWith(
              color: AppColors.black,
            ),
          )
        ],
      ),
    );
  }
}
