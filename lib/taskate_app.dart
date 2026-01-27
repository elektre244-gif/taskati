import 'package:flutter/material.dart';
import 'package:flutter_application_1/features.dart/splash.dart/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskateApp extends StatelessWidget {
  const TaskateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(
          
        ),
      ),
    );
  }
}