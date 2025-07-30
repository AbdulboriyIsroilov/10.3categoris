import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FootsEatBottom extends StatelessWidget {
  const FootsEatBottom({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  final String title1, title2;
  final num title3;
  final int title4;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.w,
          vertical: 3.h,
        ),
        width: 158.5.w,
        height: 230.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.oq,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: AppStyles.name,
              maxLines: 1,
            ),
            Text(
              title2,
              style: AppStyles.davlat,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "$title3",
                      style: AppStyles.besh,
                    ),
                    SvgPicture.asset(AppSvg.star),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppSvg.clock),
                    Text(
                      "$title4 min",
                      style: AppStyles.besh,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
