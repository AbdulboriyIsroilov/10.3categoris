import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarMain extends StatelessWidget {
  const BottomNavigationBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 34.h),
      child: Container(
        width: 281.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.navigationBar,
          borderRadius: BorderRadius.circular(33.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(AppSvg.home),
            SvgPicture.asset(AppSvg.community),
            SvgPicture.asset(AppSvg.categories),
            SvgPicture.asset(AppSvg.profile),
          ],
        ),
      ),
    );
  }
}
