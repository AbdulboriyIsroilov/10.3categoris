import 'package:categories_page/appdetails/widget/login_page_button.dart';
import 'package:categories_page/feature/page/categories/onboarding/pages/on_boarding_welcome.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../appdetails/bottom_navigation_bar_gradient.dart';
import '../manegers/on_boarding_open_v_m.dart';

class OnBoardingOpenPage extends StatelessWidget {
  const OnBoardingOpenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingOpenVM(),
      builder: (context, child) => Consumer<OnBoardingOpenVM>(
        builder: (context, vm, child) => vm.loading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                backgroundColor: AppColors.bekraunt,
                extendBody: true,
                appBar: AppBar(
                  backgroundColor: AppColors.bekraunt,
                  automaticallyImplyLeading: false,
                ),
                body: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(vm.onBOpen.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 23,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 37,
                              vertical: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                Text(
                                  vm.onBOpen[index]["title"],
                                  style: AppStyles.w600s20w,
                                  maxLines: 1,
                                ),
                                Text(
                                  vm.onBOpen[index]["subtitle"],
                                  style: AppStyles.w400s13w,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 430.w,
                            height: 736.h,
                            child: Stack(
                              children: [
                                Image.network(
                                  vm.onBOpen[index]["image"],
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: double.infinity,
                                    height: 368.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.bekraunt,
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    height: 368.h,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.bekraunt,
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                bottomNavigationBar: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    BottomNavigationBarGradient(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 47.65.h),
                      child: LoginPageButton(
                        text: "Continue",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OnBoardingWelcome(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
