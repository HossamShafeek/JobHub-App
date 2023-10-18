import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/widgets/custom_empty_widget.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/presentation/views/widgets/job_list_view_item.dart';

class JobsViewBody extends StatelessWidget {
  const JobsViewBody({Key? key, required this.jobs}) : super(key: key);

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    if (jobs.isNotEmpty) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return JobListViewItem(jobModel: jobs[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: AppConstants.padding10h,
          );
        },
      );
    } else {
      return CustomEmptyWidget(
        imagePath: AppAssets.search2,
        firstMessage: AppStrings.firstEmptySearchMessage,
        secondMessage: AppStrings.secondEmptySearchMessage,
      );
    }
  }
}
