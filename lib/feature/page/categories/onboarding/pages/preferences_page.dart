import 'package:categories_page/appdetails/widget/login_page_button.dart';
import 'package:categories_page/feature/page/categories/LoginSigininPage/login_page.dart';
import 'package:categories_page/feature/page/categories/onboarding/pages/allergic_page.dart';
import 'package:categories_page/feature/page/categories/common/widget/on_bording_canteyner.dart';
import 'package:categories_page/feature/page/categories/onboarding/widget/on_boarding_gread_view_image.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_svg.dart';
import '../manegers/preferences_view_model.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PreferencesViewModel(),
      builder: (context, child) {
        return Consumer<PreferencesViewModel>(
          builder: (context, vm, child) {
            return vm.loading
                ? Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Scaffold(
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
                          vm: vm.activIndex,
                        ),
                      ),
                    ),
                    body: Padding(
                      padding: EdgeInsets.fromLTRB(36.w, 55.h, 37.w, 59.65.h),
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select your cuisines preferences",
                            style: AppStyles.loginIn,
                          ),
                          Text(
                            "Please select your cuisines preferences for a better recommendations or you can skip it.",
                            style: AppStyles.string,
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: 125.49.h,
                                  ),
                              itemCount: vm.preferences.length,
                              itemBuilder: (context, index) {
                                return OnBoardingGreadViewImage(
                                  vm: vm.preferences,
                                  index: index,
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LoginPageButton(
                                text: "skip",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AllergicPage(),
                                    ),
                                  );
                                },
                                foregraundcolor: AppColors.fif,
                                weth: 162,
                              ),
                              LoginPageButton(
                                text: "Continue",
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                backraundcolor: AppColors.navigationBar,
                                foregraundcolor: AppColors.oq,
                                weth: 162,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}
