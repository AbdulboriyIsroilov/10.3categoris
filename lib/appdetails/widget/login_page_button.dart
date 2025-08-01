import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageButton extends StatelessWidget {
  const LoginPageButton({
    super.key,
    required this.text,
    this.backraundcolor = AppColors.appbarsvg,
    this.foregraundcolor = AppColors.fif,
    required this.onPressed,
    this.weth = 207,
    this.hights = 45,
  });

  final String text;
  final Color backraundcolor, foregraundcolor;
  final VoidCallback onPressed;
  final double weth, hights;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backraundcolor,
        foregroundColor: foregraundcolor,
        fixedSize: Size(weth.w, hights.h),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.w600s20not,
      ),
    );
  }
}
