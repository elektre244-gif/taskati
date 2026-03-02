import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class CustomCirclerImage extends StatelessWidget {
    final UserModel userData;
    final double? radius;
  const CustomCirclerImage( {super.key, this.radius, required this.userData});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
       radius: radius,
       backgroundImage: userData.image != null && userData.image!.isNotEmpty
      ? FileImage(File(userData.image!))
      : null,
       child: userData.image == null || userData.image!.isEmpty
      ? Icon(Icons.person,size:60.sp)
      : null,
     );
 
  }

}