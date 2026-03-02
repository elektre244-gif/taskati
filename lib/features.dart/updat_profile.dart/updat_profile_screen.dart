import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/custom_bottom.dart';
import 'package:flutter_application_1/core.dart/widget/custom_circler_image.dart';
import 'package:flutter_application_1/core.dart/widget/custom_user_text.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_application_1/features.dart/home_screen/home_screen.dart';
import 'package:flutter_application_1/features.dart/updat_profile.dart/widget/custom_contanier_name.dart';
import 'package:flutter_application_1/features.dart/updat_profile.dart/widget/custom_show_image_dialog.dart';
import 'package:flutter_application_1/features.dart/updat_profile.dart/widget/custom_show_name_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatefulWidget {
   final UserModel userData;
  const UpdateProfileScreen({super.key, required this.userData,});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_rounded),
          onTap:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            CustomCirclerImage( userData:widget.userData,radius: 70.sp,),
            
            CustomContanierName(userData: widget.userData),
        
            CustomShowImageDialog(),
       
            CustomShowNameDialog(),
          ],
        ),
      ),
    );
  }
}
