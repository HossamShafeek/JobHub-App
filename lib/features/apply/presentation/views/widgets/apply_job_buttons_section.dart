import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/functions/show_snack_bar.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/gradient_button.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/apply_job_cubit/apply_job_state.dart';
import 'package:jobhub/features/apply/presentation/cubits/get_apply_cubit/get_apply_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/get_chat_cubit/get_chat_cubit.dart';
import 'package:jobhub/features/chat/presentation/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';

class ApplyJobButtonsSection extends StatelessWidget {
  const ApplyJobButtonsSection({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApplyJobCubit, ApplyJobState>(
      listener: (context, state) {
        if (state is ApplyJobSuccessState) {
          showSuccessSnackBar(
              context: context, message: 'Applied Successfully');
          SendMessageCubit.get(context)
              .sendMessageFromCompany(userId: AppConstants.userId)
              .then((value) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.layoutView, (route) => false);
          });
        } else if (state is ApplyJobFailureState) {
          return showErrorSnackBar(
            context: context,
            message: 'File is too Large',
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: AppConstants.padding45h,
          child: Row(
            children: [
              ApplyJobCubit.get(context).currentStep > 0
                  ? Expanded(
                      child: GradientButton(
                        title: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: double.infinity,
                          margin: EdgeInsets.all(AppConstants.padding2h),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.circular(AppConstants.radius6r)),
                          child: Text(
                            AppStrings.back,
                            style: AppStyles.textStyle18.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          ApplyJobCubit.get(context).decreaseCurrentStep();
                        },
                      ),
                    )
                  : const SizedBox(),
              ApplyJobCubit.get(context).currentStep > 0
                  ? SizedBox(
                      width: AppConstants.padding5w,
                    )
                  : const SizedBox(),
              Expanded(
                child: GradientButton(
                  title: Text(
                    AppStrings.next,
                    style: AppStyles.textStyle18.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  onPressed: () {
                    if (ApplyJobCubit.get(context).currentStep < 1) {
                      if (ApplyJobCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        ApplyJobCubit.get(context).increaseCurrentStep();
                      }
                    } else if (ApplyJobCubit.get(context).currentStep == 1 &&
                        ApplyJobCubit.get(context).pickedFile != null) {
                      ApplyJobCubit.get(context).applyNow(
                          jobTimeType: job.jobTimeType!,
                          jobId: job.id.toString());
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
