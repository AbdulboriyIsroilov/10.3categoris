import 'package:categories_page/appdetails/widget/login_page_button.dart';
import 'package:categories_page/appdetails/widget/text_fiald_pasword.dart';
import 'package:categories_page/appdetails/widget/text_field_not_pasword.dart';
import 'package:categories_page/feature/page/categories/common/widget/modul.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/app_svg.dart';
import '../../../../utils/client.dart';

Future<String> signin({
  required String username,
  required String firstName,
  required String lastName,
  required String email,
  required String phoneNumber,
  required String birthDate,
  required String password,
}) async {
  var reseponse = await dio.post(
    "/auth/register",
    data: {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phoneNumber": phoneNumber,
      "birthDate": birthDate,
      "password": password,
      "cookingLevelId": null,
    },
  );
  if (reseponse.statusCode != 201) {
    throw Exception(reseponse.data);
  }
  return reseponse.data["accessToken"];
}

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final emailCantroller = TextEditingController();
  final mobileNumberCantroller = TextEditingController();
  final dateOfBirthCantroller = TextEditingController();
  final passwordCantroller = TextEditingController();
  final confirmPasswordCantroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    emailCantroller.dispose();
    mobileNumberCantroller.dispose();
    dateOfBirthCantroller.dispose();
    passwordCantroller.dispose();
    confirmPasswordCantroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bekraunt,
      appBar: AppBar(
        backgroundColor: AppColors.bekraunt,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: AppStyles.title,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(AppSvg.backArrow),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Form(
          key: formKey,
          child: Column(
            spacing: 9,
            children: [
              SizedBox(height: 90),
              TextFieldNotPasword(
                controller: fullNameController,
                text: 'Full name',
                hint: 'Ism Familiya',
              ),
              TextFieldNotPasword(
                controller: emailCantroller,
                text: 'Email',
                hint: 'example@example.com',
              ),
              TextFieldNotPasword(
                controller: mobileNumberCantroller,
                text: 'Mobile Number',
                hint: '90 000 00 00',
              ),
              TextFieldNotPasword(
                controller: dateOfBirthCantroller,
                text: 'Date of birth',
                hint: 'YYY-MM-DD',
              ),
              TextFialdPasword(
                controller: passwordCantroller,
                text: "password",
                hint: "password",
              ),
              TextFialdPasword(
                controller: confirmPasswordCantroller,
                text: "Confirm Password",
                hint: "Confirm Password",
              ),
              SizedBox(height: 22),
              SizedBox(
                width: 194.w,
                height: 32.h,
                child: Text(
                  "By continuing, you agree to Terms of Use and Privacy Policy.",
                  style: AppStyles.string,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              LoginPageButton(
                text: "Sign In",
                onPressed: () async {
                  if (passwordCantroller.text ==
                      confirmPasswordCantroller.text) {
                    try {
                      String fullName = fullNameController.text.trim();

                      List<String> parts = fullName.split(" ");

                      String firstName = parts.isNotEmpty ? parts[0] : '';
                      String lastName = parts.length > 1
                          ? parts.sublist(1).join(" ")
                          : '';

                      var token = await signin(
                        username: fullNameController.text,
                        firstName: firstName,
                        lastName: lastName,
                        email: emailCantroller.text,
                        phoneNumber: mobileNumberCantroller.text,
                        birthDate: dateOfBirthCantroller.text,
                        password: passwordCantroller.text,
                      );
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return Modul(
                            title1: 'Sign up succesful!',
                            title2: "You have successfully created an account. ✔",
                          );
                        },
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error: $e"),
                        ),
                      );
                      throw Exception("Error: $e");
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Password tasdiqlanmadi"),
                      ),
                    );
                  }
                },
                backraundcolor: AppColors.navigationBar,
                foregraundcolor: AppColors.oq,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppStyles.string,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: AppColors.fif),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Log In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
