import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/route.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../auth bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final watchBloc = context.watch<AuthBloc>();
    final readBloc = context.read<AuthBloc>();
    return Scaffold(
      drawer: CustomDrawer(size: size),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: SafeArea(
          child: Column(
            children: [
              UserInfoBanner(
                size: size,
                username: "${watchBloc.user.username}",
                email: "${watchBloc.user.email}",
                drawer: CustomDrawer(size: size),
              ),
              SizedBox(height: size.height * 0.02),
              // acct balance
              AcctBalance(
                  size: size, acctBallance: "${watchBloc.user.acctBalance}"),
              BankInfo(
                size: size,
                bankName: "${watchBloc.user.bankName}",
                acctHolderName: "${watchBloc.user.acctName}",
                acctNumber: "${watchBloc.user.acctNumber}",
              ),
              SizedBox(height: size.height * 0.03),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(size.width * 0.2),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.03),
                        Row(
                          children: [
                            AppText(
                              text: "What will you like to do ?",
                              size: 18.sp,
                              textColor: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MenuButton(
                              size: size,
                              imgUrl: "assets/data-logo.png",
                              text: "Buy Data",
                              bgColor: Colors.amber.shade900,
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.dataHome);
                              },
                            ),
                            MenuButton(
                              size: size,
                              imgUrl: "assets/call-logo.png",
                              text: "Buy Airtime",
                              bgColor: Colors.green.shade900,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoute.buyAirtime);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MenuButton(
                              size: size,
                              imgUrl: "assets/cable-logo.png",
                              text: "Cable Tv",
                              bgColor: Colors.blue.shade900,
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.cableTv);
                              },
                            ),
                            MenuButton(
                              size: size,
                              imgUrl: "assets/bill-logo.png",
                              text: "Electricity",
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoute.electrictyBill);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
