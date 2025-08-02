import 'package:categories_page/feature/page/categories/widget/manegers/expord_page_view_model.dart';
import 'package:categories_page/feature/page/categories/widget/resipe_item/foots_eat.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../appdetails/bottom_navigation_bar_gradient.dart';
import '../../../appdetails/bottom_navigation_bar_main.dart';
import 'common/app_bar/recipe_app_bar_bottom.dart';
import 'common/app_bar/recipe_app_bar_main.dart';

class ExpordPage extends StatefulWidget {
  const ExpordPage({
    super.key,
    required this.categoryId,
    required this.title,
  });

  final int categoryId;
  final String title;

  @override
  State<ExpordPage> createState() => _ExpordPageState();
}

class _ExpordPageState extends State<ExpordPage> {
  late int activindex;
  late int categoryId;
  String bartitle = "Breakfast";

  @override
  void initState() {
    super.initState();
    categoryId = widget.categoryId;
    bartitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpordPageViewMudel(categoryId: categoryId),
      builder: (context, child) {
        return Consumer<ExpordPageViewMudel>(
          builder: (context, vm, child) {
            return Scaffold(
              extendBody: true,
              backgroundColor: AppColors.bekraunt,
              appBar: RecipeAppBarMain(
                toolbarHeight: 75.h,
                title: widget.title,
                bottom: RecipeAppBarBottom(selectedIndex: categoryId),
              ),
              body: GridView.builder(
                padding: EdgeInsets.fromLTRB(37.w, 19, 37.w, 126),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 19.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: vm.expordcategoris.length,
                itemBuilder: (context, index) {
                  return FootsEat(
                    recipe: vm.expordcategoris[index],
                    appbartitle: widget.title,
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
