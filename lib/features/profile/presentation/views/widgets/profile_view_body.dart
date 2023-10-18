import 'package:flutter/material.dart';
import 'package:jobhub/config/local/cache_helper.dart';
import 'package:jobhub/config/routes/app_routes.dart';
import 'package:jobhub/core/functions/show_update_profile_bottom_sheet.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_strings.dart';
import 'package:jobhub/core/utils/app_styles.dart';
import 'package:jobhub/core/widgets/gradient_button.dart';
import 'package:jobhub/features/profile/data/models/profile_model/profile_model.dart';
import 'package:jobhub/features/profile/presentation/views/widgets/image_user_profile.dart';
import 'package:jobhub/features/profile/presentation/views/widgets/name_and_email_user_profile.dart';
import 'package:jobhub/features/profile/presentation/views/widgets/profile_item_widget.dart';
import 'package:jobhub/features/profile/presentation/views/widgets/update_name_bottom_sheet_content.dart';
import 'package:jobhub/features/profile/presentation/views/widgets/update_password_bottom_sheet_content.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key, required this.profileModel})
      : super(key: key);

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImageUserProfile(),
          NameAndEmailUserProfile(
            name: profileModel.data!.name!,
            email: profileModel.data!.email!,
          ),
          ProfileItemWidget(
            title: 'Name',
            content: profileModel.data!.name!,
            onTap: () {
              showUpdateProfileBottomSheet(
                context: context,
                content: UpdateNameBottomSheetContent(
                  name: profileModel.data!.name!,
                ),
              );
            },
          ),
          ProfileItemWidget(
            title: 'Password',
            content: '**********',
            onTap: () {
              showUpdateProfileBottomSheet(
                context: context,
                content: const UpdatePasswordBottomSheetContent(),
              );
            },
          ),
          SizedBox(
            height: AppConstants.padding20h,
          ),
          GradientButton(
            onPressed: () {
              CacheHelper.removeData(key: 'token').then((value) {
                Navigator.pushReplacementNamed(context, Routes.loginView);
              });
            },
            title: Text(
              AppStrings.logout,
              style: AppStyles.textStyle18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
