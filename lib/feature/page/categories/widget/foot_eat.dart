import 'package:categories_page/feature/page/categories/widget/foots_eat.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FootEat extends StatelessWidget {
  const FootEat({
    super.key,
    required this.appbartitle,
    required this.image,
    required this.footname,
    required this.title3,
    required this.title4,
  });

  final String appbartitle, image, footname, title3, title4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bekraunt,
      appBar: AppBar(
        backgroundColor: AppColors.bekraunt,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            AppSvg.backArrow,
          ),
        ),
        centerTitle: true,
        title: Text(
          appbartitle,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 26.h),
        child: Column(
          children: [
            SizedBox(
              width: 357.w,
              height: 337.h,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
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
                          footname,
                          style: AppStyles.footName,
                        ),
                        SizedBox(
                          width: 85.65.w,
                          height: 18.w,
                          child: Row(
                            spacing: 5,
                            children: [
                              SvgPicture.asset(AppSvg.starFilled),
                              Text(title3,style: AppStyles.string,),
                              SvgPicture.asset(AppSvg.reviews),
                              Text("2.273",style: AppStyles.string,)
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
                      child: Image.asset(
                        image,
                        width: double.infinity,
                        height: 281.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
