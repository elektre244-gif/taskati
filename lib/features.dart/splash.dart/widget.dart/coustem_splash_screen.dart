import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CoustemSplashScreen extends StatelessWidget {
  const CoustemSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Lottie.asset('assets/splash_screen.json'),
        SizedBox(height: 15.h,),
        Text('Taskati',style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        SizedBox(height: 20.h,),
        Text('It’s Time to Get Organized',style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade400,
        ),)
        ],
      );
  }
}