import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.padding45h),
      child: SmoothPageIndicator(
        controller: OnBoardingCubit.get(context).pageController,
        count: OnBoardingCubit.get(context).boarding.length,
        effect: ExpandingDotsEffect(
          dotColor: AppColors.primary.withOpacity(0.5),
          dotHeight: 8.h,
          dotWidth: 10.w,
          expansionFactor: 4.w,
          spacing: 5.w,
          activeDotColor: AppColors.primary,
        ),
      ),
    );
  }
}
