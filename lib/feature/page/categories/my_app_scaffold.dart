import 'package:categories_page/utils/app_list.dart';
import 'package:categories_page/utils/app_svg.dart';
import 'package:categories_page/utils/client.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../appdetails/bottom_navigation_bar_gradient.dart';
import '../../../appdetails/bottom_navigation_bar_main.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import 'widget/foots_qolip.dart';

Future<List> fetchCategories() async {
  var reseponse = await dio.get("/categories/list");
  if (reseponse.statusCode != 200) {
    throw Exception(reseponse.data);
  }
  return reseponse.data;
}

class MyAppScaffold extends StatefulWidget {
  const MyAppScaffold({super.key});

  @override
  State<MyAppScaffold> createState() => _MyAppScaffoldState();
}

class _MyAppScaffoldState extends State<MyAppScaffold> {

  int navigator = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCategories(),
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
            backgroundColor: AppColors.bekraunt,
            appBar: AppBar(
              backgroundColor: AppColors.bekraunt,
              leading: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppSvg.backArrow),
              ),
              centerTitle: true,
              title: Text("Categories", style: AppStyles.title),
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
                SizedBox(
                  width: 5.w,
                ),
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
                SizedBox(
                  width: 37.w,
                ),
              ],
            ),
            body: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 37.w, vertical: 14.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 38.9.w,
                childAspectRatio: 1 / 1.19,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return FootsQolip(
                  image: snapshot.data![index]["image"],
                  title: snapshot.data![index]["title"],
                  categoryid: snapshot.data![index]["id"],
                  index: index,
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
