import 'package:categories_page/appdetails/widget/login_page_button.dart';
import 'package:categories_page/feature/page/categories/onboarding/pages/preferences_page.dart';
import 'package:categories_page/feature/page/categories/onboarding/widget/cooking_level_text.dart';
import 'package:categories_page/utils/app_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../../../utils/app_svg.dart';
import '../../common/widget/on_bording_canteyner.dart';

class CookingLevelPage extends StatelessWidget {
  const CookingLevelPage({super.key});

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
          icon: SvgPicture.asset(AppSvg.backArrow),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15),
          child: OnBordingCanteyner(
            vm: 0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(36, 55.h, 38, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "¿What is your cooking level?",
              style: AppStyles.loginIn,
            ),
            Text(
              "Please select you cooking level for a better recommendations.",
              style: AppStyles.string,
            ),
            ...List.generate(
              AppList.cookingLevel.length,
              (index) {
                return CookingLevelText(
                  index: index,
                );
              },
            ),
            Spacer(),
            Center(
              child: LoginPageButton(
                text: "Continue",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PreferencesPage(),
                    ),
                  );
                },
                backraundcolor: AppColors.navigationBar,
                foregraundcolor: AppColors.texts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
