import 'package:categories_page/feature/page/categories/expord_page.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.id,
  });

  final int id;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ExpordPage(categoryId: id, title: title),
          ),
        );
      },
      child: Container(
        height: 25.h,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 9.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.fif : Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.fif,
          ),
        ),
      ),
    );
  }
}
