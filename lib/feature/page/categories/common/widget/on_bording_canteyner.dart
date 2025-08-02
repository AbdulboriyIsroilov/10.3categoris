import 'package:categories_page/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnBordingCanteyner extends StatelessWidget {
  const OnBordingCanteyner({
    super.key,
    required this.vm,
  });

  final int vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: 230.w,
        height: 12,
        decoration: BoxDecoration(
          color: AppColors.oq,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: vm == 0
            ? Alignment.topLeft
            : vm == 1
            ? Alignment.topCenter
            : Alignment.topRight,
        child: Container(
          width: 76.66.w,
          height: 12,
          decoration: BoxDecoration(
            color: AppColors.navigationBar,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
