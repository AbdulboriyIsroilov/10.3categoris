import 'package:categories_page/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeIconButton extends StatelessWidget {
  const RecipeIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.foregroundColor = AppColors.fif,
    this.backgroundColor = AppColors.appbarsvg,
  });

  final String icon;
  final Color foregroundColor, backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tight(Size.square(28.r)),
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: backgroundColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          foregroundColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
