import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_network_image.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';

class JobDetailsWidget extends StatelessWidget {
  const JobDetailsWidget({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNetworkImage(
          image: job.image!,
          width: MediaQuery.of(context).size.width / 2.8,
          height: MediaQuery.of(context).size.height / 4.8,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.padding5h),
          child: Text(
            job.name!,
            style: AppStyles.textStyle22,
          ),
        ),
        Text(
          '${job.compName!} . ${job.location}',
          textAlign: TextAlign.center,
          style: AppStyles.textStyle14.copyWith(
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
