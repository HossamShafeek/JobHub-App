import 'package:flutter/material.dart';
import 'package:jobhub/core/shimmer/shimmer_container_effect.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class ShimmerAppliedListView extends StatelessWidget {
  const ShimmerAppliedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(AppConstants.padding10h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radius8r),
            color: AppColors.grey50,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const ShimmerContainerEffect(),
                    SizedBox(
                      height: AppConstants.padding10h,
                    ),
                    const ShimmerContainerEffect(),
                  ],
                ),
              ),
              SizedBox(width: AppConstants.padding8w,),
              ShimmerContainerEffect(
                width: MediaQuery.of(context).size.width/6,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: AppConstants.padding10h,
        );
      },
      itemCount: 10,
    );
  }
}
