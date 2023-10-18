import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jobhub/config/icons/icons_broken.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';

class CustomNetworkImage extends StatelessWidget {
  final double? borderRadius;
  final String image;
  final Color? backgroundColor;
  final double? height;
  final double? width;

  const CustomNetworkImage(
      {Key? key,
      this.borderRadius,
      required this.image,
      this.backgroundColor,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(borderRadius ?? AppConstants.radius8r),
        color: backgroundColor ?? AppColors.white,
      ),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        height: double.infinity,
        errorWidget: (context, url, error) => Icon(
          IconBroken.Info_Square,
          color: AppColors.primary,
          size: AppConstants.iconSize24,
        ),
      ),
    );
  }
}
