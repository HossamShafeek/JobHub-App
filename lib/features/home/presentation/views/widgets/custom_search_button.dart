import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/shimmer/shimmer_search_button.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_state.dart';

class CustomSearchButton extends StatelessWidget {
  const CustomSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecentlyJobsCubit, GetRecentlyJobsState>(
      builder: (context, state) {
        if (state is GetRecentlyJobsSuccessState) {
          return Container(
            padding: EdgeInsets.all(AppConstants.padding5h),
            margin: EdgeInsets.only(top: AppConstants.padding15h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8r),
              color: AppColors.grey50,
            ),
            width: MediaQuery.of(context).size.width,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.jobsView);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.search,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(AppConstants.padding5h),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(AppConstants.radius5r),
                      color: Colors.white,
                    ),
                    child: Icon(
                      IconBroken.Search,
                      color: AppColors.primary,
                      size: AppConstants.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const ShimmerSearchButton();
        }
      },
    );
  }
}
