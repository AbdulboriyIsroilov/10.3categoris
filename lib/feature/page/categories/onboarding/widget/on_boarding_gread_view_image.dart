import 'package:categories_page/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OnBoardingGreadViewImage extends StatefulWidget {
  const OnBoardingGreadViewImage({
    super.key,
    required this.vm,
    required this.index,
    this.defaultBorderColor = Colors.transparent,
  });

  final List vm;
  final int index;
  final Color defaultBorderColor;

  @override
  State<OnBoardingGreadViewImage> createState() =>
      _OnBoardingGreadViewImageState();
}

class _OnBoardingGreadViewImageState extends State<OnBoardingGreadViewImage> {
  bool buttom = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttom = !buttom;
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.74),
              border: BoxBorder.all(
                color: buttom ? AppColors.green : widget.defaultBorderColor,
                width: 1.51,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.74),
              child: Image.network(
                widget.vm[widget.index]["image"],
                width: 98.63.w,
                height: 98.63.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            widget.vm[widget.index]["title"],
            style: TextStyle(color: AppColors.oq),
          ),
        ],
      ),
    );
  }
}
