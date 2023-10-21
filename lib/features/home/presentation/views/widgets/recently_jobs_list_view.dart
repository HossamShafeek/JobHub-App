import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/shimmer/shimmer_recently_jobs_list_view.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_error_widget.dart';
import 'package:jobhub/core/widgets/custom_text_button.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_state.dart';
import 'package:jobhub/features/home/presentation/views/widgets/job_list_view_item.dart';

class RecentlyJobsListView extends StatelessWidget {
  const RecentlyJobsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecentlyJobsCubit, GetRecentlyJobsState>(
      builder: (context, state) {
        if (state is GetRecentlyJobsSuccessState) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.recentlyJob,
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
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return JobListViewItem(
                      jobModel: state.jobsModel.data![index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: AppConstants.padding10h,
                  );
                },
                itemCount: state.jobsModel.data!.length,
              ),
            ],
          );
        } else if (state is GetRecentlyJobsFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerRecentlyListView();
        }
      },
    );
  }
}
