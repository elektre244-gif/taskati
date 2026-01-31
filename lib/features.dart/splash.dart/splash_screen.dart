import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features.dart/authentication/authentication_screen.dart';
import 'package:flutter_application_1/features.dart/splash.dart/widget.dart/coustem_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5),(){
    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Authentication() )) ;
   } );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoustemSplashScreen(),
    );
  }
}