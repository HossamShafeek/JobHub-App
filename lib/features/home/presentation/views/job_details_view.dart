import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/widgets/custom_back_button.dart';
import 'package:jobhub/features/Saved/presentation/cubits/add_saved_cubit/add_saved_cubit.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_cubit.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_state.dart';
import 'package:jobhub/features/home/data/models/jobs_model/job.dart';
import 'package:jobhub/features/home/presentation/views/widgets/job_details_view_body.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({Key? key, required this.job}) : super(key: key);

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text('Job Details'),
          centerTitle: true,
          actions: [
            BlocBuilder<GetSavedCubit, GetSavedState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (!GetSavedCubit.get(context).savedId.contains(job.id)) {
                      AddToSavedCubit.get(context)
                          .addToSaved(jobId: job.id.toString())
                          .then((value) {
                        GetSavedCubit.get(context).getSaved();
                      });
                    }
                  },
                  icon: Icon(
                    IconBroken.Bookmark,
                    size: AppConstants.iconSize24,
                    color: GetSavedCubit.get(context).savedId.contains(job.id)
                        ? AppColors.primary
                        : Colors.grey,
                  ),
                );
              },
            ),
          ],
        ),
        body: JobDetailsViewBody(
          job: job,
        ));
  }
}
