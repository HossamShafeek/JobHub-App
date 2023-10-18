import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/widgets/custom_back_button.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/apply_job_view_body.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';

class ApplyJobView extends StatelessWidget {
  const ApplyJobView({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(AppStrings.applyJob),
      ),
      body: ApplyJobViewBody(
        job: job,
      ),
    );
  }
}
