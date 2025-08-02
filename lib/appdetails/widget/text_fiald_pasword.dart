import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFialdPasword extends StatefulWidget {
  const TextFialdPasword({
    super.key,
    required this.controller,
    required this.text,
    required this.hint,
  });

  final TextEditingController controller;
  final String text, hint;

  @override
  State<TextFialdPasword> createState() => _TextFialdPaswordState();
}

class _TextFialdPaswordState extends State<TextFialdPasword> {
  bool passw = false;

  @override
  Widget build(BuildContext _context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: AppStyles.string,
        ),
        TextField(
          obscureText: passw,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 36.w),
            constraints: BoxConstraints(
              minWidth: 357.w,
              maxWidth: 357.w,
            ),
            filled: true,
            fillColor: AppColors.appbarsvg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            hintText: widget.hint,
            hintStyle: AppStyles.follow,
            suffixIcon: IconButton(
              onPressed: () {
                passw = !passw;
                setState(() {});
              },
              icon: passw
                  ? Icon(Icons.remove_red_eye_outlined)
                  : SvgPicture.asset(AppSvg.password),
            ),
          ),
        ),
      ],
    );
  }
}
