import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: size.height * 0.4,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/login_logo.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: BackNavigation(size: size),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  AppText(
                    text: "Password Reset",
                    size: 18.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black87,
                  ),
                  SizedBox(height: size.height * 0.03),
                  const FieldDescription(desc: "Email Address"),
                  SizedBox(height: size.height * 0.01),
                  SignUpTextField(
                      size: size, controller: TextEditingController()),
                  SizedBox(height: size.height * 0.03),
                  AppButton(
                    size: size,
                    textSize: 16,
                    bgColor: Colors.amber.shade900,
                    text: "Reset Password",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
