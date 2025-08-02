import 'package:categories_page/appdetails/widget/login_page_button.dart';
import 'package:categories_page/feature/page/categories/LoginSigininPage/login_page.dart';
import 'package:categories_page/feature/page/categories/onboarding/pages/cooking_level_page.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_list.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/app_svg.dart';
import '../../widget/manegers/my_scaffold_view_model.dart';

class OnBoardingWelcome extends StatelessWidget {
  const OnBoardingWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyscaffoldViewModul(),
      builder: (context, child) {
        return Consumer<MyscaffoldViewModul>(
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
                    ),
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(36, 0, 38, 13),
                      child: Column(
                        spacing: 10,
                        children: [
                          SizedBox(
                            width: 356.w,
                            height: 557.h,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 26.w,
                                    mainAxisSpacing: 27.h,
                                    mainAxisExtent: 167.h,
                                  ),
                              itemCount: vm.mycategoris.length,
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(14.67.r),
                                  child: Image.network(
                                    vm.mycategoris[index]["image"],
                                    width: 166.w,
                                    height: 167.h,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                          Text(
                            "Welcome",
                            style: AppStyles.w600s25w,
                          ),
                          Text(
                            AppList.text,
                            style: AppStyles.w400s13w,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                          SizedBox(),
                          LoginPageButton(
                            text: "I’m New",
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CookingLevelPage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(),
                          LoginPageButton(
                            text: "I’ve been here ",
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
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
