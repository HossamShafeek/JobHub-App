import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';

class CompanyTabWidget extends StatelessWidget {
  const CompanyTabWidget({Key? key, required this.job}) : super(key: key);
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'contact us',
              style: AppStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AppConstants.padding8h,
                bottom: AppConstants.padding5h,
              ),
              child: Text(
                'Email: ${job.compEmail!}',
                style: AppStyles.textStyle15.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            Text(
              'WebSite: ${job.compWebsite!}',
              style: AppStyles.textStyle15.copyWith(
                color: AppColors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppConstants.padding8h),
              child: Text(
                'about company',
                style: AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(job.aboutComp!),
          ],
        ),
      ),
    );
  }
}
