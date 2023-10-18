import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';

ThemeData appTheme() {
  return ThemeData(
      primarySwatch: Colors.blue,
      useMaterial3: false,
      unselectedWidgetColor: AppColors.grey,
      textTheme: GoogleFonts.montserratTextTheme(),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: AppConstants.systemUiOverlayStyleDark,
        titleTextStyle: AppStyles.textStyle25,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedIconTheme: IconThemeData(size: AppConstants.iconSize22),
        unselectedIconTheme: IconThemeData(size: AppConstants.iconSize22),
        selectedLabelStyle: AppStyles.textStyle15,
        unselectedLabelStyle: AppStyles.textStyle13,
      ));
}
