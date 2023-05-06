import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/custom_page_route.dart';

import '../app_widget.dart';

class UserInfoBanner extends StatelessWidget {
  const UserInfoBanner({
    super.key,
    required this.size,
    required this.username,
    required this.email,
    this.drawer,
  });

  final Size size;
  final String username;
  final String email;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/avatar.png',
          height: size.width * 0.2,
          width: size.width * 0.2,
        ),
        SizedBox(width: size.width * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: username,
              size: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: email,
              size: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        Expanded(child: Container()),
        InkWell(
          onTap: () {
            if (drawer != null) {
              Navigator.push(context, CustomPageRoute(child: drawer!));
            }
          },
          child: Padding(
            padding: EdgeInsets.only(right: size.width * 0.04),
            child: Icon(
              Icons.more_vert,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
