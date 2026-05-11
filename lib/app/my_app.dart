import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../core/resources/color_manager.dart';
import '../core/resources/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: (Size(375,812)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManager.onGenerateRoute,
        initialRoute: RoutesName.splash.routeName,
        theme: ThemeData(
          primaryColor: ColorManager.primary,
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorManager.primary,
            primary: ColorManager.primary,
          ),
          scaffoldBackgroundColor: ColorManager.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorManager.primary,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}