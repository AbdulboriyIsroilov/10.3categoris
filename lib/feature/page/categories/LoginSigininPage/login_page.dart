import 'package:categories_page/appdetails/widget/text_fiald_pasword.dart';
import 'package:categories_page/appdetails/widget/text_field_not_pasword.dart';
import 'package:categories_page/appdetails/widget/login_page_button.dart';
import 'package:categories_page/feature/page/categories/common/widget/modul.dart';
import 'package:categories_page/feature/page/categories/my_app_scaffold.dart';
import 'package:categories_page/feature/page/categories/LoginSigininPage/signin_page.dart';
import 'package:categories_page/utils/app_colors.dart';
import 'package:categories_page/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_svg.dart';
import '../../../../utils/client.dart';

Future<String> login({required String login, required String password}) async {
  var reseponse = await dio.post(
    "/auth/login",
    data: {"login": login, "password": password},
  );
  if (reseponse.statusCode != 200) {
    throw Exception(reseponse.data);
  }
  return reseponse.data["accessToken"];
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordCantroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordCantroller.dispose();
  }

  @override
  Widget build(BuildContext _context) {
    return Scaffold(
      backgroundColor: AppColors.bekraunt,
      appBar: AppBar(
        backgroundColor: AppColors.bekraunt,
        centerTitle: true,
        title: Text(
          "Login",
          style: AppStyles.title,
        ),
      ),
      body: Form(
        key: formKey,
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                SizedBox(height: 152),
                TextFieldNotPasword(
                  controller: emailController,
                  text: 'Email',
                  hint: 'example@example.com',
                ),
                TextFialdPasword(
                  controller: passwordCantroller,
                  text: 'Password',
                  hint: 'Password',
                ),
                SizedBox(height: 89),
                LoginPageButton(
                  text: 'Log In',
                  backraundcolor: AppColors.navigationBar,
                  foregraundcolor: AppColors.oq,
                  onPressed: () async {
                    try {
                      var token = await login(
                        login: emailController.text,
                        password: passwordCantroller.text,
                      );
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return Modul(
                            title1: "Login In Successful!",
                            title2: "Successfully logged in. ✔",
                          );
                        },
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Email or Password Error"),
                        ),
                      );
                      throw Exception("Error: $e");
                    }
                  },
                ),
                SizedBox(height: 7.h),
                LoginPageButton(
                  text: 'Sign up',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
                ),
                SizedBox(height: 34.59.h),
                Text(
                  "Forgot Password?",
                  style: AppStyles.forgot,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
