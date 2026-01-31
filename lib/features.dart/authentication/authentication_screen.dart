import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/app_constant.dart';
import 'package:flutter_application_1/core.dart/widget/custom_bottom.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_application_1/features.dart/authentication/widget/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final ImagePicker picker = ImagePicker();
  XFile? image ;
  TextEditingController nameController=TextEditingController();
  void OpenCamera()async{
 image= await picker.pickImage(source: ImageSource.camera);
 setState(() {
   
 });
  }

   void OpenGaliery()async{
 image= await picker.pickImage(source: ImageSource.gallery);
 setState(() {
   
 });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w,top: 100.0.h),
            child: Column(
              spacing:15.h,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Visibility(
               visible:image==null,
               child:   CircleAvatar(
                  radius: 90.r,
                  child:Icon(Icons.person,size: 100.r,)
                ),
              replacement:   Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  
                  shape: BoxShape.circle,
                  image: DecorationImage(fit: BoxFit.cover,image: Image.file(File(image?.path??"")).image,)
                ),
              )
          ),
                CustomBottom(name: 'Upload From Camera',
                onPressed: ()async {
                 OpenCamera();
                },
                ),
          
                CustomBottom(name: 'Upload From Galiery',
                 onPressed: ()async {
                  OpenGaliery();
                },),
          
                Divider(),
          
                CustomTextField(),
          
                CustomBottom(name: 'Done',
                onPressed: () {
                  Hive.box<UserModel>(AppConstant.userBox).add(UserModel(name: nameController.text, image: image?.path??""));
                },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
