import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/app_constant.dart';
import 'package:flutter_application_1/core.dart/widget/custom_bottom.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class CustomShowImageDialog extends StatefulWidget {
  const CustomShowImageDialog({super.key});

  @override
  State<CustomShowImageDialog> createState() => _CustomShowImageDialogState();
}

class _CustomShowImageDialogState extends State<CustomShowImageDialog> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  TextEditingController nameController = TextEditingController();
  void OpenCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void OpenGaliery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottom(
      name: "Take a picture",
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
                  CustomBottom(
                    name: 'Upload From Camera',
                    onPressed: () async {
                      OpenCamera();
                      setState(() {
                        Hive.box<UserModel>(AppConstant.userBox).put(
                          0,
                          UserModel(
                            name: nameController.text,
                            image: image?.path ?? "",
                          ),
                        );
                      });
                    },
                  ),
                  CustomBottom(
                    name: 'Upload From Galiery',
                    onPressed: () async {
                      OpenGaliery();
                      setState(() {
                        Hive.box<UserModel>(AppConstant.userBox).put(
                          0,
                          UserModel(
                            name: nameController.text,
                            image: image?.path ?? "",
                          ),
                        );
                      });
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
