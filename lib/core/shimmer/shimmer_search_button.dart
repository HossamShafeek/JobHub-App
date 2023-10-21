import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerSearchButton extends StatelessWidget {
  const ShimmerSearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ShimmerContainerEffect(
      margin: EdgeInsets.only(top: AppConstants.padding15h),
      width: double.infinity,
      height: 40.h,
    );
  }
}
