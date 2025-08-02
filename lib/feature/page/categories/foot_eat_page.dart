import 'package:categories_page/feature/page/categories/widget/manegers/foot_eat_view_model.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../appdetails/bottom_navigation_bar_gradient.dart';
import '../../../appdetails/bottom_navigation_bar_main.dart';
import 'common/widget/recipe_icon_button.dart';

class FootEat extends StatefulWidget {
  const FootEat({
    super.key,
    required this.appbartitle,
    required this.id,
  });

  final int id;
  final String appbartitle;

  @override
  State<FootEat> createState() => _FootEatState();
}

class _FootEatState extends State<FootEat> {
  bool follow = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FootEatViewMudel(id: widget.id),
      builder: (context, child) {
        return Consumer<FootEatViewMudel>(
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
                        icon: SvgPicture.asset(
                          AppSvg.backArrow,
                        ),
                      ),
                      centerTitle: true,
                      title: Text(
                        widget.appbartitle,
                        style: AppStyles.title,
                      ),
                      actions: [
                        RecipeIconButton(icon: AppSvg.heart, onPressed: () {}),
                        SizedBox(width: 5.w),
                        RecipeIconButton(icon: AppSvg.share, onPressed: () {}),
                        SizedBox(width: 37.w),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(37, 26, 37, 134),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 31,
                          children: [
                            SizedBox(
                              width: 357.w,
                              height: 337.h,
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 16,
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.title,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          vm.footcotegoris["title"],
                                          style: AppStyles.footName,
                                        ),
                                        SizedBox(
                                          width: 85.65.w,
                                          height: 18.w,
                                          child: Row(
                                            spacing: 5,
                                            children: [
                                              SvgPicture.asset(
                                                AppSvg.starFilled,
                                              ),
                                              Text(
                                                "${vm.footcotegoris["rating"]}",
                                                style: AppStyles.string,
                                              ),
                                              SvgPicture.asset(AppSvg.reviews),
                                              Text(
                                                "2.273",
                                                style: AppStyles.string,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        vm.footcotegoris["photo"],
                                        width: double.infinity,
                                        height: 281.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 105.h,
                                    left: 142.w,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                        23.66,
                                        17.87,
                                        20.42,
                                        13.52,
                                      ),
                                      width: 74.01.w,
                                      height: 71.46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(37),
                                        color: AppColors.title,
                                      ),
                                      child: SvgPicture.asset(AppSvg.play),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              spacing: 20,
                              children: [
                                Row(
                                  spacing: 15,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        vm.footcotegoris["user"]["profilePhoto"],
                                        width: 61.w,
                                        height: 63.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 132.87.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "@${vm.footcotegoris["user"]["username"]}",
                                            style: AppStyles.besh,
                                          ),
                                          Text(
                                            "${vm.footcotegoris["user"]["firstName"]} ${vm.footcotegoris["user"]["lastName"]}",
                                            style: AppStyles.string,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: AppColors.appbarsvg,
                                        fixedSize: Size(109.09, 0),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () {
                                        follow = !follow;
                                        setState(() {});
                                      },
                                      child: Text(
                                        follow ? "Following" : "Follow",
                                        style: AppStyles.follow,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AppSvg.threeDots,
                                      width: 4.03.w,
                                      height: 15.h,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: AppColors.fif,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  spacing: 7,
                                  children: [
                                    Text(
                                      "Details",
                                      style: AppStyles.wtext,
                                    ),
                                    SvgPicture.asset(
                                      AppSvg.clock,
                                      colorFilter: ColorFilter.mode(
                                        AppColors.oq,
                                        BlendMode.modulate,
                                      ),
                                    ),
                                    Text(
                                      "${vm.footcotegoris["timeRequired"]} min",
                                      style: AppStyles.string,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(
                                          vm.footcotegoris["description"],
                                          style: AppStyles.string,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "•Ingredients",
                                  style: AppStyles.wtext,
                                ),
                                Column(
                                  spacing: 3,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...List.generate(
                                      vm.footcotegoris["instructions"].length,
                                      (
                                        index,
                                      ) {
                                        return SizedBox(
                                          width: double.infinity,
                                          height: 16,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              spacing: 4,
                                              children: [
                                                Text(
                                                  "•  ${vm.footcotegoris["instructions"][index]["order"]}",
                                                  style: AppStyles.stringpink,
                                                ),
                                                Text(
                                                  "${vm.footcotegoris["instructions"][index]["text"]}",
                                                  style: AppStyles.string,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
