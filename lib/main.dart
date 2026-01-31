import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/app_constant.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_application_1/taskate_app.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
 await Hive.initFlutter();
 Hive.registerAdapter(UserModelAdapter());
 await Hive.openBox<UserModelAdapter>(AppConstant.userBox);
  runApp(TaskateApp());
}
