import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/widgets/custom_container_button.dart';
import 'package:jobhub/features/Saved/presentation/cubits/add_saved_cubit/add_saved_cubit.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_cubit.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_state.dart';

class AddToSavedButton extends StatelessWidget {
  const AddToSavedButton({Key? key, required this.jobId}) : super(key: key);

  final int jobId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedCubit, GetSavedState>(
      builder: (context, state) {
        return CustomContainerButton(
          onTap: () {
            if (!GetSavedCubit.get(context).savedId.contains(jobId)) {
              AddToSavedCubit.get(context)
                  .addToSaved(jobId: jobId.toString())
                  .then((value) {
                GetSavedCubit.get(context).getSaved();
              });
            }
          },
          icon: IconBroken.Bookmark,
          color: GetSavedCubit.get(context).savedId.contains(jobId)
              ? AppColors.primary
              : AppColors.grey,
        );
      },
    );
  }
}
