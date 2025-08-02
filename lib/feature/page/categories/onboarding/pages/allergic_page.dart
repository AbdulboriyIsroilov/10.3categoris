import 'package:categories_page/feature/page/categories/LoginSigininPage/login_page.dart';
import 'package:categories_page/feature/page/categories/onboarding/widget/on_boarding_gread_view_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../appdetails/widget/login_page_button.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../../../../../utils/app_svg.dart';
import '../../common/widget/on_bording_canteyner.dart';
import '../manegers/allergic_view_model.dart';

class AllergicPage extends StatelessWidget {
  const AllergicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllergicViewModel(),
      builder: (context, child) {
        return Consumer<AllergicViewModel>(
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
                            "¿You have any allergic?",
                            style: AppStyles.loginIn,
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.",
                            style: AppStyles.string,
                          ),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisExtent: 125.49.h,
                                  ),
                              itemCount: vm.allergic.length,
                              itemBuilder: (context, index) {
                                return OnBoardingGreadViewImage(
                                  vm: vm.allergic,
                                  index: index,
                                  defaultBorderColor: AppColors.appbarsvg,
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
