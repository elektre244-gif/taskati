import 'package:flutter/material.dart';
import 'package:flutter_application_1/features.dart/splash.dart/widget.dart/coustem_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoustemSplashScreen(),
    );
  }
}