import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerJobListViewItem extends StatelessWidget {
  const ShimmerJobListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10r),
      ),
      padding: EdgeInsets.all(AppConstants.padding8h),
      height: 100.h,
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: ShimmerContainerEffect(
              height: double.infinity,
            ),
          ),
          SizedBox(width: AppConstants.padding8w,),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainerEffect(
                      height: AppConstants.defaultPadding,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                    ShimmerContainerEffect(
                      height: AppConstants.padding25h,
                      width: AppConstants.padding25h,
                    ),
                  ],
                ),
                ShimmerContainerEffect(
                  height: AppConstants.defaultPadding,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                ShimmerContainerEffect(
                  height: AppConstants.defaultPadding,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainerEffect(
                      height: AppConstants.defaultPadding,
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    ShimmerContainerEffect(
                      height: AppConstants.defaultPadding,
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}