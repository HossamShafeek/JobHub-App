import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_assets.dart';
import 'package:jobhub/core/utils/app_colors.dart';

class ImageUserProfile extends StatelessWidget {
  const ImageUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 80,
        backgroundColor: AppColors.primary,
        child: CircleAvatar(
          radius: 76,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 72,
            child: Image.asset(AppAssets.userImage),
          ),
        ),
      ),
    );
  }
}
