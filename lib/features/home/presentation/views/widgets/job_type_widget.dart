import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/presentation/views/widgets/container_job_type.dart';

class JobTypeWidget extends StatelessWidget {
  const JobTypeWidget({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.padding10h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContainerJopType(
            text: job.jobType!,
          ),
          SizedBox(
            width: 10.w,
          ),
          ContainerJopType(
            text: job.jobTimeType!,
          )
        ],
      ),
    );
  }
}
