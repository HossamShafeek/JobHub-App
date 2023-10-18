import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/custom_container_button.dart';
import 'package:jobhub/core/widgets/custom_network_image.dart';
import 'package:jobhub/features/Saved/data/models/get_saved_model/datum.dart';
import 'package:jobhub/features/Saved/presentation/cubits/get_saved_cubit/get_saved_cubit.dart';
import 'package:jobhub/features/Saved/presentation/cubits/remove_saved_cubit/remove_saved_cubit.dart';

class SavedListViewItem extends StatelessWidget {
  const SavedListViewItem({Key? key, required this.savedModel})
      : super(key: key);

  final Datum savedModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(AppConstants.padding8h),
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(AppConstants.radius10r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CustomNetworkImage(image: savedModel.image!),
          ),
          SizedBox(
            width: AppConstants.padding8w,
          ),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      savedModel.jobs!.name!,
                      style: AppStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomContainerButton(
                      onTap: () {
                        RemoveFromSavedCubit.get(context)
                            .removeFromSaved(jobId: savedModel.id.toString())
                            .then((value) {
                          GetSavedCubit.get(context)
                              .savedId
                              .remove(savedModel.jobId!);
                          GetSavedCubit.get(context).getSaved();
                        });
                      },
                      icon: IconBroken.Bookmark,
                      color: AppColors.primary,
                    )
                  ],
                ),
                Text(
                  '${savedModel.jobs!.compName!}: ${savedModel.jobs!.jobType}',
                  style: AppStyles.textStyle14,
                ),
                Text(
                  savedModel.jobs!.compEmail!,
                  style: AppStyles.textStyle14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      savedModel.jobs!.jobTimeType!,
                      style: AppStyles.textStyle14,
                    ),
                    Text(
                      '${savedModel.jobs!.salary!} EGP',
                      style: AppStyles.textStyle14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
