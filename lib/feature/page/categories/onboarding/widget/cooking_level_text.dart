import 'package:categories_page/utils/app_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../../../utils/app_svg.dart';
import '../../common/widget/on_bording_canteyner.dart';

class CookingLevelText extends StatefulWidget {
  const CookingLevelText({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<CookingLevelText> createState() => _CookingLevelTextState();
}

class _CookingLevelTextState extends State<CookingLevelText> {
  bool buttom = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttom = !buttom;
        setState(() {});
      },
      child: Container(
        width: 356.w,
        height: 116.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: buttom ? AppColors.navigationBar : AppColors.appbarsvg,
            width: 0.98,
          ),
        ),
        child: SizedBox(
          width: 322.w,
          height: 92.h,
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppList.cookingLevel[widget.index]["level"],
                style: AppStyles.w500s16w,
              ),
              Text(
                AppList.cookingLevel[widget.index]["title"],
                style: AppStyles.w400s13w,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
