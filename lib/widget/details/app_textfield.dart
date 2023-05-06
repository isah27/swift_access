import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.size,
    this.hintText = "",
    this.maxLine = 1,
    this.borderRadius = 0,
    this.fillColor,
    this.enable = true,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.align = TextAlign.left,
    this.textSize = 13,
    this.icon,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final int maxLine;
  final double borderRadius;
  final double textSize;
  final TextEditingController controller;
  final bool enable;
  final Color? fillColor;
  final TextAlign align;
  final TextInputType keyboardType;
  final IconData? icon;
  late final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(
        borderRadius == 0 ? size.width * 0.02 : borderRadius,
      ));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: TextFormField(
        enabled: enable,
        controller: controller,
        validator: (value) {
          if (value == "") {
            return "This is a required field";
          }
          return null;
        },
        keyboardType: keyboardType,
        textAlign: align,
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: textSize.sp),
        maxLines: maxLine,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.grey.shade100,
          hintText: hintText,
          focusedBorder: border,
          enabledBorder: border,
          suffixIcon: icon != null
              ? Icon(
                  icon,
                  size: 25.sp,
                  color: Colors.black54,
                )
              : null,
        ),
      ),
    );
  }
}

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    required this.size,
    this.hintText = "Password",
    this.maxLine = 1,
    this.borderRadius = 0,
    this.enable = true,
    required this.controller,
    this.fillColor,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final int maxLine;
  final double borderRadius;
  final TextEditingController controller;
  final bool enable;
  final Color? fillColor;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool visible = false;
  late final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(
        widget.borderRadius == 0
            ? widget.size.width * 0.02
            : widget.borderRadius,
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      child: TextFormField(
        obscureText: visible,
        enabled: widget.enable,
        controller: widget.controller,
        validator: (value) {
          if (value == "") {
            return "This is a required field";
          }
          return null;
        },
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp),
        maxLines: widget.maxLine,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.key,
            color: Colors.grey.shade400,
            size: 20.sp,
          ),
          suffix: InkWell(
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: Icon(
                visible ? Icons.visibility : Icons.visibility_off,
                size: 25.sp,
                color: Colors.grey.shade400,
              )),
          // contentPadding: EdgeInsets.only(bottom: 10, top: 20),
          filled: true,
          fillColor: widget.fillColor ?? Colors.grey.shade100,
          hintText: widget.hintText,
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
