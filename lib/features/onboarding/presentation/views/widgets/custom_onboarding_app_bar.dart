import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/config/local/cache_helper.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/widgets/custom_text_button.dart';
import 'package:jobhub/core/widgets/logo_widget.dart';

class CustomOnBoardingAppBar extends StatelessWidget {
  const CustomOnBoardingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const LogoWidget(),
        CustomTextButton(
          title: 'Skip',
          fontSize: 18.sp,
          onPressed: () {
            CacheHelper.setBoolean(key: 'onBoarding', value: true)
                .then((value) {
              Navigator.pushReplacementNamed(context, Routes.loginView);
            });
          },
        ),
      ],
    );
  }
}
