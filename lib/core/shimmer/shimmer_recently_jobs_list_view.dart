import 'package:flutter/material.dart';
import 'package:jobhub/core/shimmer/shimmer_job_list_view_item.dart';
import 'package:jobhub/core/shimmer/shimmer_title_and_view_all.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerRecentlyListView extends StatelessWidget {
  const ShimmerRecentlyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShimmerTitleAndViewAll(),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const ShimmerJobListViewItem();
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: AppConstants.padding10h,
            );
          },
          itemCount: 3,
        ),
      ],
    );
  }
}
