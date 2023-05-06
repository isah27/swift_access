import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/route.dart';

void main() {
  runApp(DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Swift Access',
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          onGenerateRoute: AppRoute.onGeneratedRoute,
        );
      },
    );
  }
}
