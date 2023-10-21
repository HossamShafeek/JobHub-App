import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerProfileData extends StatelessWidget {
  const ShimmerProfileData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShimmerCircleAvatarEffect(
          radius: 80.r,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppConstants.padding10h),
          child: ShimmerContainerEffect(
            width: MediaQuery.of(context).size.height / 6,
          ),
        ),
        ShimmerContainerEffect(
          width: MediaQuery.of(context).size.height / 4,
        ),
      ],
    );
  }
}