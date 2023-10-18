import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.radius,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget title;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
          gradient: const LinearGradient(
            colors: AppColors.blueGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
