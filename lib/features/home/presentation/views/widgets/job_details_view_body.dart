import 'package:flutter/material.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/gradient_button.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/presentation/views/widgets/custom_tab_bar.dart';
import 'package:jobhub/features/home/presentation/views/widgets/job_details_widget.dart';
import 'package:jobhub/features/home/presentation/views/widgets/job_type_widget.dart';

class JobDetailsViewBody extends StatelessWidget {
  const JobDetailsViewBody({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          JobDetailsWidget(job: job),
          JobTypeWidget(job: job),
          CustomTabBar(
            job: job,
          ),
          GradientButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.applyJob, arguments: job);
            },
            title: Text(
              AppStrings.applyNow,
              style: AppStyles.textStyle18.copyWith(
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
