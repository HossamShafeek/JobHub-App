import 'package:flutter/material.dart';
import 'package:jobhub/core/shimmer/shimmer_job_list_view_item.dart';
import 'package:jobhub/core/shimmer/shimmer_title_and_view_all.dart';


class ShimmerSuggestedJob extends StatelessWidget {
  const ShimmerSuggestedJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
       ShimmerTitleAndViewAll(),
        ShimmerJobListViewItem(),
      ],
    );
  }
}



