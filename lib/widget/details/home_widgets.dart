import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/page_route.dart';
import 'package:swift_access/widget/app_widget.dart';
import 'package:clipboard/clipboard.dart';
import '../../uitils/usefull_function.dart';

class BankInfo extends StatelessWidget {
  const BankInfo({
    super.key,
    required this.size,
    required this.bankName,
    required this.acctHolderName,
    required this.acctNumber,
  });

  final Size size;
  final String bankName;
  final String acctHolderName;
  final String acctNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.04),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber.shade900,
            Colors.amber.shade900,
            Colors.amber.shade600,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.mirror,
        ),
        borderRadius: BorderRadius.circular(size.width * 0.02),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppText(
                    text: acctNumber,
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: size.width * 0.08),
                  InkWell(
                    onTap: () {
                      FlutterClipboard.copy(acctNumber).then((value) =>
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("$acctNumber copied"))));
                    },
                    child: Icon(
                      Icons.copy,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              AppText(
                text: "ACCOUNT NAME",
                size: 12.sp,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(height: size.height * 0.01),
              AppText(
                text: acctHolderName,
                size: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              AppText(
                text: "₦50 charge",
                size: 12.sp,
                textColor: Colors.transparent,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: size.height * 0.01),
              AppText(
                text: bankName,
                size: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AcctBalance extends StatefulWidget {
  const AcctBalance({
    super.key,
    required this.size,
    required this.acctBallance,
  });

  final Size size;
  final String acctBallance;

  @override
  State<AcctBalance> createState() => _AcctBalanceState();
}

class _AcctBalanceState extends State<AcctBalance> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.06),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Account Balance",
                    size: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  AppText(
                    text: !visible
                        ? "***"
                        : "₦${UsefulFunction.currencyConverter(price: double.parse(widget.acctBallance != "" ? widget.acctBallance : "0"))}",
                    size: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: Icon(
                  !visible ? Icons.visibility : Icons.visibility_off,
                  size: 25.sp,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.size,
    this.bgColor,
    required this.text,
    required this.imgUrl,
    required this.onTap,
  });

  final Size size;
  final Color? bgColor;
  final String text;
  final String imgUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: size.width * 0.4,
        height: size.width >= 1070 ? size.height * 0.26 : size.height * 0.2,
        alignment: Alignment.center,
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.red.shade900,
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Image.asset(
              imgUrl,
              height: size.width * 0.15,
              width: size.width * 0.2,
              fit: BoxFit.fill,
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.01),
            AppText(
              text: text,
              size: 14.sp,
              // textColor: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: size.width * 0.9,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.black,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                Image.asset(
                  "assets/swift-access.png",
                  width: size.width * 0.7,
                  height: size.height * 0.22,
                  fit: BoxFit.fill,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        DrawerMenu(
                          size: size,
                          text: "Transactions",
                          icon: Icons.history,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.transactions),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Settings",
                          icon: Icons.settings,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.setting),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "About us",
                          icon: Icons.person,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.aboutUs),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Contact us",
                          icon: Icons.contact_phone_rounded,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.contactUs),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Sign out",
                          icon: Icons.logout,
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context, AppRoute.login, (route) => false),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Close",
                          icon: Icons.chevron_left,
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.45,
                      width: size.width * 0.1,
                      child: Column(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
    required this.size,
    this.onTap,
    required this.text,
    required this.icon,
    this.textSize,
    this.color,
  });

  final Size size;
  final Function()? onTap;
  final String text;
  final IconData icon;
  final double? textSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.02, bottom: size.height * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 25.sp,
              color: color ?? Colors.white,
            ),
            SizedBox(width: size.width * 0.08),
            AppText(
              text: text,
              textColor: color ?? Colors.white,
              size: textSize ?? 15.sp,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
