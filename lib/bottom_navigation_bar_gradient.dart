import 'package:categories_page/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarGradient extends StatelessWidget {
  const BottomNavigationBarGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 126.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.black, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
