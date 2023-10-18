import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_network_image.dart';
import 'package:jobhub/features/home/presentation/views/widgets/add_to_saved_button.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';

class JobListViewItem extends StatelessWidget {
  const JobListViewItem({Key? key, required this.jobModel}) : super(key: key);

  final Job jobModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(AppConstants.padding8h),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10r),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.jobDetailsView,
              arguments: jobModel);
        },
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CustomNetworkImage(image: jobModel.image!),
            ),
            SizedBox(
              width: AppConstants.padding8w,
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jobModel.name!,
                        style: AppStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddToSavedButton(jobId: jobModel.id!),
                    ],
                  ),
                  Text(
                    '${jobModel.compName!}: ${jobModel.jobType}',
                    style: AppStyles.textStyle14,
                  ),
                  Text(
                    jobModel.compEmail!,
                    style: AppStyles.textStyle14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        jobModel.jobTimeType!,
                        style: AppStyles.textStyle14,
                      ),
                      Text(
                        '${jobModel.salary!} EGP',
                        style: AppStyles.textStyle14.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
