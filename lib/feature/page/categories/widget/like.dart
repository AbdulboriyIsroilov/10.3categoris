import 'package:categories_page/appdetails/app_bar_page.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/app_svg.dart';

class Like extends StatefulWidget {
  const Like({
    super.key,
  });

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28.w,
      height: 28.h,
      child: IconButton(
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: like ? AppColors.navigationBar : AppColors.appbarsvg,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        onPressed: () {
          like = !like;
          setState(() {});
        },
        icon: SvgPicture.asset(
          AppSvg.heart,
          colorFilter: ColorFilter.mode(
            like ? AppColors.white : AppColors.fif,
            BlendMode.modulate,
          ),
        ),
      ),
    );
  }
}
