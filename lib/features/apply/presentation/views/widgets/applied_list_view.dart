import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply_model.dart';
import 'package:jobhub/features/apply/presentation/views/widgets/applied_list_view_item.dart';

class AppliedListView extends StatelessWidget {
  const AppliedListView({Key? key, required this.applyModel}) : super(key: key);

  final ApplyModel applyModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return AppliedListViewItem(
          apply: applyModel.apply![index],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppConstants.padding10h,
        );
      },
      itemCount: applyModel.apply!.length,
    );
  }
}
