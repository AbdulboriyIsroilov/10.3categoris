import 'package:categories_page/feature/page/categories/foot_eat_page.dart';
import 'package:categories_page/feature/page/categories/widget/like.dart';
import 'package:categories_page/feature/page/categories/widget/resipe_item/foots_eat_bottom.dart';
import 'package:categories_page/feature/page/categories/widget/resipe_item/foots_eat_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FootsEat extends StatelessWidget {
  const FootsEat({
    super.key,
    required this.recipe,
    required this.appbartitle,
  });

  final Map<String, dynamic> recipe;
  final String appbartitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FootEat(
              list: recipe,
              appbartitle: appbartitle,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 168.5.w,
        height: 230.h,
        child: Stack(
          children: [
            FootsEatBottom(
              title1: recipe['title'],
              title2: recipe['description'],
              title3: recipe['rating'],
              title4: recipe['timeRequired'],
            ),
            FootsEatImage(
              image: recipe['photo'],
            ),
            Positioned(
              top: 7.h,
              left: 133.w,
              child: Like(),
            ),
          ],
        ),
      ),
    );
  }
}
