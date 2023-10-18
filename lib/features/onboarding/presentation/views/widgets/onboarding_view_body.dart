import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/features/onboarding/presentation/views/widgets/custom_onboarding_app_bar.dart';
import 'package:jobhub/features/onboarding/presentation/views/widgets/next_button.dart';
import 'package:jobhub/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:jobhub/features/onboarding/presentation/views/widgets/page_indicator_widget.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
            left: AppConstants.defaultPadding,
            right: AppConstants.defaultPadding,
            bottom: AppConstants.defaultPadding),
        child: const Column(
          children: [
            CustomOnBoardingAppBar(),
            OnBoardingPageView(),
            PageIndicatorWidget(),
            NextButton(),
          ],
        ),
      ),
    );
  }
}
