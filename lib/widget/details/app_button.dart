import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.size,
    this.bgColor = Colors.amber,
    this.textColor = Colors.white,
    this.textSize = 14,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color textColor;
  final Color bgColor;
  final Function() onTap;
  final double textSize;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.03),
      child: MaterialButton(
        color: bgColor,
        minWidth: size.width * 0.9,
        padding: EdgeInsets.all(size.height * 0.015),
        onPressed: () {
          if (!isLoading) {
            onTap();
          }
        },
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
              : AppText(
                  text: text,
                  size: textSize.sp,
                  textColor: textColor,
                ),
        ),
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
    this.size = 12,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final double size;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,

      style: TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: fontWeight,
        decoration: TextDecoration.none
      ),
    );
  }
}
