import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';

class ContainerJopType extends StatelessWidget {
  const ContainerJopType({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.padding5h,
        horizontal: AppConstants.padding10w,
      ),
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.15),
          borderRadius: BorderRadius.circular(AppConstants.radius20r)),
      child: Text(
        text,
        style: AppStyles.textStyle15.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
