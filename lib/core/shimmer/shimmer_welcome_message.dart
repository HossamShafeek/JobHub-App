import 'package:flutter/material.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerWelcomeMessage extends StatelessWidget {
  const ShimmerWelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerContainerEffect(
          width: MediaQuery.of(context).size.width/2,
          height: AppConstants.padding20h,
        ),
        ShimmerContainerEffect(
          margin: EdgeInsets.only(top: AppConstants.padding8h),
          width: MediaQuery.of(context).size.width/1.4,
          height: AppConstants.padding10h,
        ),
      ],
    );
  }
}
