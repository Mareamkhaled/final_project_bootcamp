import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Routing/routes.dart';
import 'core/Routing/routing.dart';
import 'core/resources/app_strings.dart';
import 'core/resources/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routing});
  final Routing routing;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        //  debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: routing.onGenerateRoute,
        initialRoute: Routes.splash,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}