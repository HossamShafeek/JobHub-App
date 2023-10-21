import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerProfileItem extends StatelessWidget {
  const ShimmerProfileItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConstants.padding10h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainerEffect(
            width: MediaQuery.of(context).size.height / 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppConstants.padding10h,
              bottom: AppConstants.padding15h,
            ),
            child: ShimmerContainerEffect(
              height: 35.h,
            ),
          ),
          ShimmerContainerEffect(
            width: MediaQuery.of(context).size.height / 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppConstants.padding10h,
              bottom: AppConstants.padding15h,
            ),
            child: ShimmerContainerEffect(
              height: 35.h,
            ),
          ),
        ],
      ),
    );
  }
}