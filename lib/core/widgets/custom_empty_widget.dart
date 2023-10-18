import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    Key? key,
    required this.imagePath,
    required this.firstMessage,
    required this.secondMessage,
  }) : super(key: key);

  final String imagePath;
  final String firstMessage;
  final String secondMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppConstants.defaultPadding,
        right: AppConstants.defaultPadding,
        bottom: 50.h,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath, height: 200.h),
            Padding(
              padding: EdgeInsets.only(
                  top: AppConstants.padding15h, bottom: AppConstants.padding3h),
              child: Text(
                firstMessage,
                style: AppStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              secondMessage,
              style: AppStyles.textStyle15,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
