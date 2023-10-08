import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.colorForTitle,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final Color? colorForTitle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: AppStyles.textStyle14.copyWith(
          color: colorForTitle ?? AppColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
