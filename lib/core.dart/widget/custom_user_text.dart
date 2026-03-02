import 'package:flutter/material.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUserText extends StatelessWidget {
  final UserModel userData;
  const CustomUserText({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Text(userData.name,style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
            ),);
  }
}