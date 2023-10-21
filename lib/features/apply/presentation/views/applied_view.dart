import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobhub/core/shimmer/shimmer_applied_list_view.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/widgets/custom_empty_widget.dart';
import 'package:jobhub/core/widgets/custom_error_widget.dart';
import 'package:jobhub/core/widgets/loading_indicator_widget.dart';
import 'package:jobhub/features/apply/presentation/cubits/get_apply_cubit/get_apply_cubit.dart';
import 'package:jobhub/features/apply/presentation/cubits/get_apply_cubit/get_apply_state.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/applied_list_view.dart';

class AppliedView extends StatelessWidget {
  const AppliedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetApplyCubit, GetApplyState>(
      builder: (context, state) {
        if (state is GetApplySuccessState) {
          if (state.applyModel.apply!.isNotEmpty) {
            return AppliedListView(
              applyModel: state.applyModel,
            );
          } else {
            return CustomEmptyWidget(
              imagePath: AppAssets.applied,
              firstMessage: AppStrings.firstEmptyAppliedMessage,
              secondMessage: AppStrings.secondEmptyAppliedMessage,
            );
          }
        } else if (state is GetApplyFailureState) {
          return CustomErrorWidget(error: state.error);
        } else {
          return const ShimmerAppliedListView();
        }
      },
    );
  }
}
