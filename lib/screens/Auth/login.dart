import 'package:flutter/material.dart';
import 'package:swift_access/page%20route/detail/route.dart';
import 'package:swift_access/widget/app_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber.shade900,
      body: Column(
        children: [
          WelcomeBackWidget(size: size),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.12),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.08),
                    // email text field
                    AppTextField(
                      hintText: "Email",
                      size: size,
                      textSize: 18,
                      align: TextAlign.center,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: size.height * 0.01),
                    // password text field
                    AuthTextField(
                      size: size,
                      controller: TextEditingController(),
                    ),
                    const ResetPassword(),
                    SizedBox(height: size.height * 0.02),
                    Fingerprint(
                      size: size,
                      onTap: () {},
                    ),
                    SizedBox(height: size.height * 0.02),
                    AppButton(
                      text: "Login",
                      size: size,
                      bgColor: Colors.amber.shade900,
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoute.home, (route) => false);
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    LoginSignUpSwitch(size: size, isLogin: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
