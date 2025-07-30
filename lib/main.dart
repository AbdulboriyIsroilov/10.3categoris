import 'package:categories_page/feature/page/categories/expord_page.dart';
import 'package:categories_page/feature/page/categories/login_page.dart';
import 'package:categories_page/feature/page/categories/my_app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyAppScaffold(),
      ),
    );
  }
}
