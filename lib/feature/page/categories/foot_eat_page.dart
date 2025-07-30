import 'package:categories_page/feature/page/categories/widget/resipe_item/foots_eat.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_list.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../appdetails/bottom_navigation_bar_gradient.dart';
import '../../../appdetails/bottom_navigation_bar_main.dart';

class FootEat extends StatefulWidget {
  const FootEat({
    super.key,
    required this.list,
    required this.appbartitle,
  });

  final Map<String, dynamic> list;
  final String appbartitle;

  @override
  State<FootEat> createState() => _FootEatState();
}

class _FootEatState extends State<FootEat> {
  bool follow = false;

  @override
  Widget build(BuildContext _context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.bekraunt,
      appBar: AppBar(
        backgroundColor: AppColors.bekraunt,
        leading: IconButton(
          onPressed: () {
            Navigator.of(_context).pop();
          },
          icon: SvgPicture.asset(
            AppSvg.backArrow,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.appbartitle,
          style: AppStyles.title,
        ),
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
              child: SvgPicture.asset(AppSvg.heart),
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
              child: SvgPicture.asset(AppSvg.share),
            ),
          ),
          SizedBox(width: 37.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(37, 82, 37, 126),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 31,
            children: [
              SizedBox(
                width: 357.w,
                height: 337.h,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 16,
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.title,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.list["title"],
                            style: AppStyles.footName,
                          ),
                          SizedBox(
                            width: 85.65.w,
                            height: 18.w,
                            child: Row(
                              spacing: 5,
                              children: [
                                SvgPicture.asset(AppSvg.starFilled),
                                Text(
                                  "${widget.list["rating"]}",
                                  style: AppStyles.string,
                                ),
                                SvgPicture.asset(AppSvg.reviews),
                                Text(
                                  "2.273",
                                  style: AppStyles.string,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.list["photo"],
                          width: double.infinity,
                          height: 281.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 105.h,
                      left: 142.w,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(
                          23.66,
                          17.87,
                          20.42,
                          13.52,
                        ),
                        width: 74.01.w,
                        height: 71.46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(37),
                          color: AppColors.title,
                        ),
                        child: SvgPicture.asset(AppSvg.play),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                spacing: 20,
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/Images/ChefProfiles/andrew.png",
                          width: 61.w,
                          height: 63.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 132.87.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@josh-ryan",
                              style: AppStyles.besh,
                            ),
                            Text(
                              "Josh Ryan-Chef",
                              style: AppStyles.string,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.appbarsvg,
                          padding: EdgeInsets.symmetric(
                            horizontal: 19,
                            vertical: 0,
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          follow = !follow;
                          setState(() {});
                        },
                        child: Text(
                          follow ? "Following" : "Follow",
                          style: AppStyles.follow,
                        ),
                      ),
                      SvgPicture.asset(
                        AppSvg.threeDots,
                        width: 4.03.w,
                        height: 15.h,
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.fif,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    spacing: 7,
                    children: [
                      Text(
                        "Details",
                        style: AppStyles.wtext,
                      ),
                      SvgPicture.asset(
                        AppSvg.clock,
                        colorFilter: ColorFilter.mode(
                          AppColors.oq,
                          BlendMode.modulate,
                        ),
                      ),
                      Text(
                        "45 min",
                        style: AppStyles.string,
                      ),
                    ],
                  ),
                  Text(
                    "Fluffy pancakes served with silky whipped cream, a classic breakfast indulgence perfect for a leisurely morning treat.",
                    style: AppStyles.string,
                    maxLines: 2,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "•Ingredients",
                    style: AppStyles.wtext,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(AppList.ingredients.length, (index) {
                        return Text(
                          "•${AppList.ingredients[index]}",
                          style: AppStyles.string,
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
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
