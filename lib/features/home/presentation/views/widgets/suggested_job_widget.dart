import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/shimmer/shimmer_suggested_job.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_error_widget.dart';
import 'package:jobhub/core/widgets/custom_text_button.dart';
import 'package:jobhub/features/home/presentation/cubits/get_suggested_job_cubit/get_suggested_job_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/get_suggested_job_cubit/get_suggested_job_state.dart';
import 'package:jobhub/features/home/presentation/views/widgets/job_list_view_item.dart';

class SuggestedJobWidget extends StatelessWidget {
  const SuggestedJobWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSuggestedJobCubit, GetSuggestedJobState>(
      builder: (context, state) {
        if (state is GetSuggestedJobSuccessState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.suggestedJob,
                    style: AppStyles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextButton(
                    title: AppStrings.viewAll,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.jobsView);
                    },
                  ),
                ],
              ),
              JobListViewItem(jobModel: state.suggestedJobModel),
            ],
          );
        } else if (state is GetSuggestedJobFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerSuggestedJob();
        }
      },
    );
  }
}


