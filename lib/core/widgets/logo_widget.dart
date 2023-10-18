import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/utils/app_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      height: height ?? 25.h,
    );
  }
}
