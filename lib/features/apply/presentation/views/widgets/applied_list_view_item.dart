import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/features/apply/data/models/apply_model/apply.dart';

class AppliedListViewItem extends StatelessWidget {
  const AppliedListViewItem({Key? key, required this.apply}) : super(key: key);

  final Apply apply;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.padding10h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radius8r),
        color: AppColors.grey50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Date:  ',
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(

                      apply.createdAt.toString().replaceRange(11,24,''),

                    style: AppStyles.textStyle16,
                  ),
                ],
              ),
              SizedBox(
                height: AppConstants.padding8h,
              ),
              Row(
                children: [
                  Text(
                    'Work Type:  ',
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    apply.workType!,
                    style: AppStyles.textStyle16,
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Active',
            style: AppStyles.textStyle16.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
