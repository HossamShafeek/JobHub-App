import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String content;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstants.padding10h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.textStyle16.copyWith(
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: AppConstants.padding5h,
          ),
          Container(
            padding: EdgeInsets.all(AppConstants.padding5h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8r),
              color: AppColors.grey50,
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    content,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(AppConstants.padding3h),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radius5r),
                      color: Colors.white,
                    ),
                    child: Icon(
                      IconBroken.Edit,
                      color: AppColors.primary,
                      size: AppConstants.iconSize24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
