import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobhub/core/animations/fade_transition_animation.dart';
import 'package:jobhub/core/animations/slide_transition_animation.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: AppConstants.padding20h),
        child: FadeTransitionAnimation(
          duration: const Duration(seconds: 3),
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: OnBoardingCubit.get(context).pageController,
            itemCount: OnBoardingCubit.get(context).boarding.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SlideTransitionAnimation(
                      duration: const Duration(seconds: 1),
                      begin: const Offset(0.3, 0),
                      end: Offset.zero,
                      child: SvgPicture.asset(
                        OnBoardingCubit.get(context).boarding[index].image,
                      ),
                    ),
                  ),
                  SlideTransitionAnimation(
                    duration: const Duration(seconds: 1),
                    begin: const Offset(0.1, 0),
                    end: Offset.zero,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: AppConstants.padding30h,
                        bottom: AppConstants.padding10h,
                      ),
                      child: Text(
                        OnBoardingCubit.get(context).boarding[index].title,
                        style: AppStyles.textStyle22,
                      ),
                    ),
                  ),
                  FadeTransitionAnimation(
                    duration: const Duration(seconds: 1),
                    child: Text(
                      OnBoardingCubit.get(context).boarding[index].body,
                      style: AppStyles.textStyle15,
                    ),
                  ),
                ],
              );
            },
            onPageChanged: (int index) {
              OnBoardingCubit.get(context).onChangePageView(index);
            },
          ),
        ),
      ),
    );
  }
}
