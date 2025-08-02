import 'package:categories_page/feature/page/categories/my_app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../../../utils/app_svg.dart';

class Modul extends StatelessWidget {
  const Modul({
    super.key,
    required this.title1,
    required this.title2,
  });

  final String title1, title2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 249.w,
        height: 265.2.h,
        padding: EdgeInsets.fromLTRB(36, 23, 36, 15),
        decoration: BoxDecoration(
          color: AppColors.oq,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 133.w,
              height: 52.h,
              child: Text(
                title1,
                style: AppStyles.w600s20,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 82.2.w,
              height: 82.2.h,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.appbarsvg,
              ),
              child: SvgPicture.asset(
                AppSvg.profile,
                colorFilter: ColorFilter.mode(
                  AppColors.fif,
                  BlendMode.modulate,
                ),
              ),
            ),
            Text(
              title2,
              style: AppStyles.stringblack,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyAppScaffold(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navigationBar,
              ),
              child: Text(
                "OK",
                style: TextStyle(color: AppColors.oq),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
