import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldNotPasword extends StatelessWidget {
  const TextFieldNotPasword({
    super.key,
    required this.controller,
    required this.text,
    required this.hint,
  });

  final TextEditingController controller;
  final String text, hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppStyles.string,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 36.w),
            constraints: BoxConstraints(
              minWidth: 357.w,
              maxWidth: 357.w,
            ),
            filled: true,
            fillColor: AppColors.appbarsvg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            hintText: hint,
            hintStyle: AppStyles.follow,
          ),
        ),
      ],
    );
  }
}
