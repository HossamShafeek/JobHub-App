import 'package:flutter/material.dart';
import 'package:jobhub/core/shimmer/shimmer_job_list_view_item.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerSavedLisView extends StatelessWidget {
  const ShimmerSavedLisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ShimmerJobListViewItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppConstants.padding10h,
        );
      },
      itemCount: 6,
    );
  }
}
