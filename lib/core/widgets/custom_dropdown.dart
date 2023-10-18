import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_constants.dart';
import 'package:jobhub/core/utils/app_styles.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    this.validator,
    required this.title,
    required this.hintText,
    this.paddingForTop,
    this.paddingForBottom,
    required this.messageForValidate,
    required this.items,
    required this.onChange,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final String title;
  final String hintText;
  final String messageForValidate;
  final double? paddingForTop;
  final double? paddingForBottom;
  final List<DropdownMenuItem> items;
  final Function(dynamic value) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle16,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: paddingForTop ?? AppConstants.defaultPadding,
            bottom: paddingForBottom ?? AppConstants.padding15h,
          ),
          child: DropdownButtonFormField(
            validator: (value) => value == null ? messageForValidate : null,
            decoration: InputDecoration(
              fillColor: AppColors.grey50,
              filled: true,
              isDense: true,
              hintStyle: AppStyles.textStyle14.copyWith(
                color: AppColors.grey,
                fontWeight: FontWeight.normal,
              ),
              border: AppConstants.enabledBorder,
              focusedBorder: AppConstants.enabledBorder,
            ),
            isExpanded: true,
            borderRadius: BorderRadius.circular(AppConstants.radius8r),
            hint: Text(
              hintText,
              style: AppStyles.textStyle14,
            ),
            items: items,
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
