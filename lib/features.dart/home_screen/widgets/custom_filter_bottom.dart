import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilterBottom extends StatelessWidget {
  final String title;
  final bool isActive;
  final void Function()? onTap;
  const CustomFilterBottom({super.key, required this.title,  this.isActive=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(12.r),
          color:isActive? Colors.purple:Colors.transparent
        ),
        child: Center(child: Text(title,
        style: TextStyle(
          fontSize: 16.sp,
          color: isActive?Colors.white:Colors.black
        ),
        )),
      ),
    );
  }
}