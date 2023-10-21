import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerTitleAndViewAll extends StatelessWidget {
  const ShimmerTitleAndViewAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.padding10h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShimmerContainerEffect(
            height: 15.h,
            width: MediaQuery.of(context).size.width / 3,
          ),
          ShimmerContainerEffect(
            height: 15.h,
            width: MediaQuery.of(context).size.width / 6,
          ),
        ],
      ),
    );
  }
}