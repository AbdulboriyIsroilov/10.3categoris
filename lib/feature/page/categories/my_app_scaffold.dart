import 'package:categories_page/feature/page/categories/widget/manegers/my_scaffold_view_model.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../appdetails/bottom_navigation_bar_gradient.dart';
import '../../../appdetails/bottom_navigation_bar_main.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import 'common/widget/recipe_icon_button.dart';
import 'widget/foots_qolip.dart';

class MyAppScaffold extends StatefulWidget {
  const MyAppScaffold({super.key});

  @override
  State<MyAppScaffold> createState() => _MyAppScaffoldState();
}

class _MyAppScaffoldState extends State<MyAppScaffold> {
  int navigator = 0;

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
                    extendBody: true,
                    backgroundColor: AppColors.bekraunt,
                    appBar: AppBar(
                      backgroundColor: AppColors.bekraunt,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: SvgPicture.asset(AppSvg.backArrow),
                      ),
                      centerTitle: true,
                      title: Text("Categories", style: AppStyles.title),
                      actions: [
                        RecipeIconButton(icon: AppSvg.notification, onPressed: () {}),
                        SizedBox(
                          width: 5.w,
                        ),
                        RecipeIconButton(icon: AppSvg.search, onPressed: () {}),
                        SizedBox(
                          width: 37.w,
                        ),
                      ],
                    ),
                    body: GridView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 37.w,
                        vertical: 14.h,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 38.9.w,
                        childAspectRatio: 1 / 1.19,
                      ),
                      itemCount: vm.mycategoris.length,
                      itemBuilder: (context, index) {
                        return FootsQolip(
                          image: vm.mycategoris[index]["image"],
                          title: vm.mycategoris[index]["title"],
                          id: vm.mycategoris[index]["id"],
                        );
                      },
                    ),
                    bottomNavigationBar: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        BottomNavigationBarGradient(),
                        BottomNavigationBarMain(),
                      ],
                    ),
                  );
          },
        );
      },
    );
  }
}
