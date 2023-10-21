import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircleAvatarEffect extends StatelessWidget {
  const ShimmerCircleAvatarEffect({Key? key,  this.radius})
      : super(key: key);

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey.withOpacity(0.3),
      highlightColor: AppColors.white.withOpacity(0.6),
      child: CircleAvatar(
        backgroundColor: AppColors.white.withOpacity(0.9),
        radius: radius ?? 15.r,
      ),
    );
  }
}
