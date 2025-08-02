import 'package:categories_page/appdetails/widget/login_page_button.dart';
import 'package:categories_page/feature/page/categories/widget/manegers/preferences_view_model.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_svg.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PreferencesViewModel(),
      builder: (context, child) {
        return Consumer<PreferencesViewModel>(
          builder: (context, vm, child) {
            return Scaffold(
              backgroundColor: AppColors.bekraunt,
              appBar: AppBar(
                backgroundColor: AppColors.bekraunt,
                leading: IconButton(
                  onPressed: () {
                    vm.minus();
                  },
                  icon: SvgPicture.asset(AppSvg.backArrow),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(15),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                      width: 230.w,
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.oq,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      alignment: vm.activIndex == 0
                          ? Alignment.topLeft
                          : vm.activIndex == 1
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 122.49.h,
                        ),
                        itemCount: vm.preferences.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(11.74),
                                child: Image.network(
                                  vm.preferences[index]["image"],
                                  width: 98.63.w,
                                  height: 98.63.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                vm.preferences[index]["title"],
                                style: TextStyle(color: AppColors.oq),
                              ),
                            ],
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
                            vm.skip();
                          },
                          foregraundcolor: AppColors.fif,
                          weth: 162,
                        ),
                        LoginPageButton(
                          text: "Continue",
                          onPressed: () {},
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
