import 'package:categories_page/feature/page/categories/expord_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_styles.dart';

class FootsQolip extends StatelessWidget {
  const FootsQolip({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  final String image, title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ExpordPage(
              categoryId: id,
              title: title,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.61),
            child: Image.network(
              image,
              width: 158.55.w,
              height: 145.39.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: AppStyles.imageText,
          ),
        ],
      ),
    );
  }
}
