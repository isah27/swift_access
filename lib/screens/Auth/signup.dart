import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: SafeArea(
            child: Column(
              children: [
                // SizedBox(height: size.height * 0.05),
                AppText(
                  text: "Create Account",
                  size: 18.sp,
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black87,
                ),
                SizedBox(height: size.height * 0.02),
                const FieldDescription(desc: "Full Name"),
                SizedBox(height: size.height * 0.01),
                SignUpTextField(
                  size: size,
                  controller: TextEditingController(),
                ),
                SizedBox(height: size.height * 0.02),
                const FieldDescription(desc: "Username"),
                SizedBox(height: size.height * 0.01),
               SignUpTextField(
                  size: size,
                  controller: TextEditingController(),
                ),
                SizedBox(height: size.height * 0.02),
                const FieldDescription(desc: "Email Address"),
                SizedBox(height: size.height * 0.01),
                SignUpTextField(
                  size: size,
                  controller: TextEditingController(),
                ),
                SizedBox(height: size.height * 0.02),
                const FieldDescription(desc: "Phone Number"),
                SizedBox(height: size.height * 0.01),
                SignUpTextField(
                  size: size,
                  controller: TextEditingController(),
                ),
                SizedBox(height: size.height * 0.02),
                const FieldDescription(desc: "Home Address"),
                SizedBox(height: size.height * 0.01),
                SignUpTextField(
                  size: size,
                  controller: TextEditingController(),
                ),

                SizedBox(height: size.height * 0.02),
                const FieldDescription(desc: "Password"),
                SizedBox(height: size.height * 0.01),
                SignUpTextField(
                  size: size,
                  controller: TextEditingController(),
                ),
                SizedBox(height: size.height * 0.03),
                AppButton(
                  size: size,
                  textSize: 16,
                  bgColor: Colors.amber.shade900,
                  text: "Sign Up",
                  onTap: () {},
                ),
                SizedBox(height: size.height * 0.03),
                LoginSignUpSwitch(size: size, isLogin: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}