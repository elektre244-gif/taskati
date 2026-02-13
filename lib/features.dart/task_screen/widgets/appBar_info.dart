import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarInfo extends StatelessWidget {
  const AppbarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.indigo
        ),
        title: Text("Add Task",style: TextStyle(
          fontSize: 20.sp,
          color: Colors.indigo
        ),),
      );
  }
}