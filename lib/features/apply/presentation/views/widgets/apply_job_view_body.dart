import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_state.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/apply_job_buttons_section.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/custom_stepper_widget.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/presentation/views/widgets/job_details_widget.dart';

class ApplyJobViewBody extends StatelessWidget {
  const ApplyJobViewBody({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplyJobCubit, ApplyJobState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            children: [
              (state is ApplyJobLoadingState)
                  ? Padding(
                      padding: EdgeInsets.only(bottom: AppConstants.padding2h),
                      child: const LinearProgressIndicator(),
                    )
                  : const SizedBox(),
              JobDetailsWidget(job: job),
              const CustomStepperWidget(),
              ApplyJobButtonsSection(
                job: job,
              ),
            ],
          ),
        );
      },
    );
  }
}
