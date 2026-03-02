import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/custom_user_text.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContanierName extends StatelessWidget {
  final UserModel userData;
  const CustomContanierName({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 40.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
                
              ),
              child:CustomUserText(userData: userData),
            );
  }
}