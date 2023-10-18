import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppConstants {
  static String token = '';
  static String userId = '';
  static const String path = 'assets/images/';
  static final double defaultPadding = 12.h;
  static final double defaultPaddingW = 12.w;
  static final double padding15h = 15.h;
  static final double padding50h = 50.h;
  static final double padding30h = 30.h;
  static final double padding25h = 25.h;
  static final double padding45h = 45.h;
  static final double padding40h = 40.h;
  static final double padding10h = 10.h;
  static final double padding20h = 20.h;
  static final double padding10w = 10.w;
  static final double padding8w = 8.w;
  static final double padding15w = 15.w;
  static final double padding5w = 5.w;
  static final double padding3w = 3.w;
  static final double padding8h = 8.h;
  static final double padding2h = 2.h;
  static final double padding5h = 5.h;
  static final double padding3h = 3.h;
  static final double radius15r = 15.r;
  static final double radius8r = 8.r;
  static final double radius6r = 6.r;
  static final double radius10r = 10.r;
  static final double radius5r = 5.r;
  static final double radius30r = 30.r;
  static final double radius20r = 20.r;
  static final double radius25r = 25.r;
  static final double radius28r = 28.r;
  static final double iconSize24 = 24.sp;
  static final double iconSize23 = 23.sp;
  static final double iconSize18 = 18.sp;
  static final double iconSize28 = 28.sp;
  static final double iconSize33 = 33.sp;
  static final double iconSize22 = 22.sp;
  static final double iconSize20 = 20.sp;

  static final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius8r),
    borderSide: BorderSide(
      width: 1.1.w,
      color: AppColors.primary,
    ),
  );

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius8r),
    borderSide: BorderSide.none,
  );

  static const SystemUiOverlayStyle systemUiOverlayStyleLight =
      SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: AppColors.transparent,
  );
  static const SystemUiOverlayStyle systemUiOverlayStyleDark =
      SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  );
}
