import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/shimmer/shimmer_profile_data.dart';
import 'package:jobhub/core/shimmer/shimmer_profile_item.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerProfileView extends StatelessWidget {
  const ShimmerProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ShimmerProfileData(),
          const ShimmerProfileItem(),
          ShimmerContainerEffect(
            height: 40.h,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}