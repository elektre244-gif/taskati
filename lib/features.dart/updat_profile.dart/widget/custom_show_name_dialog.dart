import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/app_constant.dart';
import 'package:flutter_application_1/core.dart/widget/custom_bottom.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart' show UserModel;
import 'package:flutter_application_1/features.dart/authentication/widget/custom_text_field.dart';
import 'package:flutter_application_1/features.dart/home_screen/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class CustomShowNameDialog extends StatelessWidget {
  TextEditingController nameController=TextEditingController();
    XFile? image ;
 CustomShowNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottom(
              name: "Name changed",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 20.h,
                        children: [
                         CustomTextField(controller: nameController,),
                            CustomBottom(name: 'Done',
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  Hive.box<UserModel>(AppConstant.userBox).put( 0,UserModel(name: nameController.text,image: image?.path ?? "",),);
                },
                ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
  }
}