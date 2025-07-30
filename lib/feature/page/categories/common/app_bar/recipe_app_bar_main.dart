import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bottoms/recipe_icon_button.dart';

class RecipeAppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarMain({
    super.key,
    required this.title,
    this.bottom,
    this.toolbarHeight = 56,
  });

  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size(
    double.infinity,
    bottom != null ? bottom!.preferredSize.height + toolbarHeight : toolbarHeight,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Align(
        alignment: Alignment.centerRight,
        child: RecipeIconButton(
          icon: AppSvg.backArrow,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.fif,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      centerTitle: true,
      title: Text(title, style: AppStyles.title),
      actionsPadding: EdgeInsets.only(right: 37.w),
      actions: [
        RecipeIconButton(icon: AppSvg.notification, onPressed: () {}),
        SizedBox(width: 5.w),
        RecipeIconButton(icon: AppSvg.search, onPressed: () {}),
      ],
      bottom: bottom,
    );
  }
}
