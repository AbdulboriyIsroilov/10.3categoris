import 'package:categories_page/app_bar_page.dart';
import 'package:categories_page/foots_eat.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_list.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'bottom_navigation_bar_gradient.dart';
import 'bottom_navigation_bar_main.dart';
import 'utils/app_svg.dart';

class ExpordPage extends StatefulWidget {
  const ExpordPage({
    super.key,
  });

  @override
  State<ExpordPage> createState() => _ExpordPageState();
}

class _ExpordPageState extends State<ExpordPage> {
  int activindex = 0;
  String bartitle = "Breakfast";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.bekraunt,
      appBar: AppBar(
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
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 37.h, vertical: 19),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19.w,
          mainAxisSpacing: 15 .h,
          childAspectRatio: 1 / 1.5,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return activindex==0
              ? FootsEat(
            title1: AppList.listMap[index]['title1'],
            title2: AppList.listMap[index]['title2'],
            title3: AppList.listMap[index]['title3'],
            title4: AppList.listMap[index]['title4'],
            image: AppList.listMap[index]['image'],
          )
              : activindex==1
              ? FootsEat(
            title1: AppList.listMap2[index]['title1'],
            title2: AppList.listMap2[index]['title2'],
            title3: AppList.listMap2[index]['title3'],
            title4: AppList.listMap2[index]['title4'],
            image: AppList.listMap2[index]['image'],
          )
              : activindex==2
              ? FootsEat(
            title1: AppList.listMap3[index]['title1'],
            title2: AppList.listMap3[index]['title2'],
            title3: AppList.listMap3[index]['title3'],
            title4: AppList.listMap3[index]['title4'],
            image: AppList.listMap3[index]['image'],
          )
              : activindex==3
              ? FootsEat(
            title1: AppList.listMap4[index]['title1'],
            title2: AppList.listMap4[index]['title2'],
            title3: AppList.listMap4[index]['title3'],
            title4: AppList.listMap4[index]['title4'],
            image: AppList.listMap4[index]['image'],
          )
              : activindex==4
              ? FootsEat(
            title1: AppList.listMap5[index]['title1'],
            title2: AppList.listMap5[index]['title2'],
            title3: AppList.listMap5[index]['title3'],
            title4: AppList.listMap5[index]['title4'],
            image: AppList.listMap5[index]['image'],
          )
              : activindex==5
              ? FootsEat(
            title1: AppList.listMap6[index]['title1'],
            title2: AppList.listMap6[index]['title2'],
            title3: AppList.listMap6[index]['title3'],
            title4: AppList.listMap6[index]['title4'],
            image: AppList.listMap6[index]['image'],
          )
              : FootsEat(
            title1: AppList.listMap7[index]['title1'],
            title2: AppList.listMap7[index]['title2'],
            title3: AppList.listMap7[index]['title3'],
            title4: AppList.listMap7[index]['title4'],
            image: AppList.listMap7[index]['image'],
          );
        },
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBarGradient(),
          BottomNavigationBarMain(),
        ],
      ),
    );
  }
}
