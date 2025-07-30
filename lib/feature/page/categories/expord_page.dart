import 'package:categories_page/appdetails/app_bar_page.dart';
import 'package:categories_page/feature/page/categories/widget/foots_eat.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_list.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../appdetails/bottom_navigation_bar_gradient.dart';
import '../../../appdetails/bottom_navigation_bar_main.dart';
import '../../../utils/app_svg.dart';
import '../../../utils/client.dart';

Future<List> fetchRecipes({required int categoryId}) async {
  var reseponse = await dio.get("/recipes/list?Category=${categoryId}");
  if (reseponse.statusCode != 200) {
    throw Exception(reseponse.data);
  }
  return reseponse.data;
}

Future<List> fetchRecipesBottom() async {
  var reseponse = await dio.get("/categories/list");
  if (reseponse.statusCode != 200) {
    throw Exception(reseponse.data);
  }
  return reseponse.data;
}

class ExpordPage extends StatefulWidget {
  const ExpordPage({
    super.key,
    required this.bottomindex,
    required this.categoryId,
  });

  final int bottomindex;
  final int categoryId;

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
    activindex = widget.bottomindex;
    categoryId = widget.categoryId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchRecipes(categoryId: categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Something went wrong: "),
            ),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
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
              title: Text(bartitle, style: AppStyles.title),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.w),
                      color: AppColors.appbarsvg,
                    ),
                    child: SvgPicture.asset(AppSvg.notification),
                  ),
                ),
                SizedBox(width: 5.w),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.w),
                      color: AppColors.appbarsvg,
                    ),
                    child: SvgPicture.asset(AppSvg.search),
                  ),
                ),
                SizedBox(width: 37.w),
              ],
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 39.h),
                child: FutureBuilder(
                  future: fetchRecipesBottom(),
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (snapshots.hasError) {
                      return Scaffold(
                        body: Center(
                          child: Text("Something went wrong: "),
                        ),
                      );
                    } else if (snapshots.hasData) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 19.h,
                          children: [
                            ...List.generate(8, (index) {
                              return TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: activindex == index
                                      ? AppColors.navigationBar
                                      : Colors.transparent,
                                  foregroundColor: activindex == index
                                      ? AppColors.oq
                                      : AppColors.title,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: () {
                                  activindex = index;
                                  bartitle = snapshots.data![index]["title"];
                                  setState(() {});
                                  fetchRecipes(categoryId: snapshots.data![index]["id"]);
                                },
                                child: Text(
                                  snapshots.data![index]["title"],
                                  style: AppStyles.appbarbottom,
                                ),
                              );
                            }),
                          ],
                        ),
                      );
                    }
                    return Scaffold(
                      body: Center(
                        child: Text("bilimman"),
                      ),
                    );
                  },
                ),
              ),
            ),
            body: GridView.builder(
              padding: EdgeInsets.fromLTRB(37.w, 19, 37.w, 126),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return FootsEat(
                  title1: snapshot.data![index]['title'],
                  title2: snapshot.data![index]['description'],
                  title3: snapshot.data![index]['rating'],
                  title4: snapshot.data![index]['timeRequired'],
                  image: snapshot.data![index]['photo'],
                  barTitle: AppList.list[6],
                );
              }
            ),
            bottomNavigationBar: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BottomNavigationBarGradient(),
                BottomNavigationBarMain(),
              ],
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text("bilimman"),
          ),
        );
      },
    );
  }
}
