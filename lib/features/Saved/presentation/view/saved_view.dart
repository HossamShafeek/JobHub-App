import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/shimmer/shimmer_saved_list_view.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/widgets/custom_empty_widget.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_cubit.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_state.dart';
import 'package:jobhub/features/Saved/presentation/view/widgets/saved_list_view_item.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedCubit, GetSavedState>(
      builder: (context, state) {
        if (state is GetSavedSuccessState) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            itemBuilder: (context, index) {
              return SavedListViewItem(
                  savedModel: state.savedModel.data![index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: AppConstants.padding10h,
              );
            },
            itemCount: state.savedModel.data!.length,
          );
        } else if (state is GetSavedFailureState) {
          return CustomEmptyWidget(
            imagePath: AppAssets.saved,
            firstMessage: AppStrings.firstEmptySavedMessage,
            secondMessage: AppStrings.secondEmptySavedMessage,
          );
        } else {
          return const ShimmerSavedLisView();
        }
      },
    );
  }
}
