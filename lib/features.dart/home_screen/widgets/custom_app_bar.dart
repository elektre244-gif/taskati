import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/custom_circler_image.dart';
import 'package:flutter_application_1/core.dart/widget/custom_user_text.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_application_1/features.dart/updat_profile.dart/updat_profile_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomAppBar extends StatelessWidget {
  final UserModel userData;
  const CustomAppBar({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start
          ,children: [
          InkWell(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen(userData: userData,)));
            },
            child: CustomUserText(userData: userData)
          ),
          Text("Have a nice day",style: TextStyle(
            fontSize: 20.sp,
          ),)
        ],)),

    CustomCirclerImage(userData: userData,radius: 40.sp,),
      ],
    );
  }
}