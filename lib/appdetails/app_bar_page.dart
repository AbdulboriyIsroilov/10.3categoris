import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_list.dart';

class AppBarPage extends StatefulWidget implements PreferredSizeWidget {
  const AppBarPage({
    super.key,
  });

  @override
  State<AppBarPage> createState() => _AppBarPageState();

  @override
  Size get preferredSize => Size(double.infinity, 100.h);
}

class _AppBarPageState extends State<AppBarPage> {
  int activindex = 0;
  String bartitle = "Breakfast";

  @override
  Widget build(BuildContext _context) {
    return AppBar(
      backgroundColor: AppColors.bekraunt,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(AppSvg.backArrow),
      ),
      centerTitle: true,
      title: Text(bartitle, style: AppStyles.title),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 28.w,
            height: 28.h,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.w),
              color: AppColors.appbarsvg,
            ),
            child: SvgPicture.asset(AppSvg.notification),
          ),
        ),
        SizedBox(width: 5.w),
        InkWell(
          onTap: () {},
          child: Container(
            width: 28.w,
            height: 28.h,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.w),
              color: AppColors.appbarsvg,
            ),
            child: SvgPicture.asset(AppSvg.search),
          ),
        ),
        SizedBox(
          width: 37.w,
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 39.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 19.h,
            children: [
              ...List.generate(AppList.list.length, (index) {
                return TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: activindex == index
                        ? AppColors.navigationBar
                        : Colors.transparent,
                    foregroundColor: activindex == index
                        ? AppColors.oq
                        : AppColors.title,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    activindex = index;
                    bartitle = AppList.list[index];
                    setState(() {});
                  },
                  child: Text(
                    AppList.list[index],
                    style: AppStyles.appbarbottom,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
