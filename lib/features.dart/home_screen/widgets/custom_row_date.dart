import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/custom_bottom.dart';
import 'package:flutter_application_1/features.dart/task_screen/task_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomRowDate extends StatelessWidget {
  const CustomRowDate({super.key, required Future<Null> Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       Expanded(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(DateFormat.MMMEd().format(DateTime.now()).toString(),style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
             ),),
           ],
         ),
       ),
       
    SizedBox(width: 150.w,child: CustomBottom(name: 'AddTask',onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskScreen()));
    }, ),),
//     Divider(
//   color: Colors.grey,
//   thickness: 2,   
//   height: 30,       
//   indent: 20,    
//   endIndent: 20,    
// )

    ],);
      
  }
}