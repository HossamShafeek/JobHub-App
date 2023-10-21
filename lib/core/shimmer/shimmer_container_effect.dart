import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainerEffect extends StatelessWidget {
  const ShimmerContainerEffect({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
    this.baseColor,
    this.highlightColor,
    this.margin,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.grey.withOpacity(0.3),
      highlightColor: highlightColor ?? AppColors.white.withOpacity(0.6),
      child: Container(
        margin: margin,
        width: width,
        height: height??AppConstants.defaultPadding,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(borderRadius ?? AppConstants.radius8r),
        ),
      ),
    );
  }
}
