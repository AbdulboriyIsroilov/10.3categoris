import 'package:categories_page/feature/page/categories/widget/foot_eat.dart';
import 'package:categories_page/feature/page/categories/widget/like.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FootsEat extends StatelessWidget {
  const FootsEat({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.image,
    required this.barTitle,
  });

  final String title1, title2,image, barTitle;
  final num  title3;
  final int title4;

  // final int activindex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.5.w,
      height: 230.h,
      child: Stack(
        children: [
          Align(
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
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FootEat(appbartitle: barTitle, image: image, footname: title1, title3: "$title3", title4: "$title4 min",),
                ),
              );
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.7),
                      blurRadius: 10,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    image,
                    width: 169.w,
                    height: 153.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 7.h,
            left: 133.w,
            child: Like(),
          ),
        ],
      ),
    );
  }
}
