import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_back_button.dart';
import 'package:jobhub/features/home/presentation/cubits/get_recently_jobs_cubit/get_recently_jobs_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:jobhub/features/home/presentation/cubits/search_cubit/search_state.dart';
import 'package:jobhub/features/home/presentation/views/widgets/jobs_view_body.dart';
import 'package:jobhub/features/home/presentation/views/widgets/search_text_field.dart';

class JobsView extends StatelessWidget {
  const JobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: const CustomBackButton(),
            title: SearchCubit.get(context).isSearching
                ? SearchTextField(
                    controller: SearchCubit.get(context).searchController,
                    onChange: (value) {
                      SearchCubit.get(context).getSearchedDoctorsList(
                        jobName: value,
                        jobs:
                            GetRecentlyJobsCubit.get(context).jobsModel!.data!,
                      );
                    },
                  )
                : const Text(AppStrings.jobs),
            actions: [
              SearchCubit.get(context).isSearching
                  ? IconButton(
                      onPressed: () {
                        SearchCubit.get(context).stopSearch();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: AppColors.primary,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        SearchCubit.get(context).startSearch(context);
                      },
                      icon: const Icon(
                        IconBroken.Search,
                        color: AppColors.primary,
                      ),
                    ),
            ],
          ),
          body: JobsViewBody(
            jobs: SearchCubit.get(context).searchController.text.isNotEmpty
                ? SearchCubit.get(context).searchedJobsList
                : GetRecentlyJobsCubit.get(context).jobsModel!.data!,
          ),
        );
      },
    );
  }
}
