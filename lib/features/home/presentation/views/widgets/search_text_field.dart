import 'package:flutter/material.dart';
import 'package:jobhub/core/utils/app_colors.dart';
import 'package:jobhub/core/utils/app_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      maxLines: 1,
      onChanged: onChange,
      style: AppStyles.textStyle18,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: AppStyles.textStyle16,
      ),
    );
  }
}
