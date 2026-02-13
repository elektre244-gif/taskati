import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/Custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class FormValidator extends StatelessWidget {
  FormValidator({super.key});
 var formKey=GlobalKey<FormState>();
  @override
   var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var dateController=TextEditingController();
  var startTimeController=TextEditingController();
  var endTimeController=TextEditingController();
  String? date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;


  Widget build(BuildContext context) {
    return  Form(
                 autovalidateMode:AutovalidateMode.onUserInteraction ,
                key: formKey
                ,child: Column(
                 spacing: 20.h,
                 children: [
                   CustomTextFormFiled(
                     controller: titleController,
                     hintText: "Task Title",
                     validator:(value){
                       if(value==null||value.isEmpty){
                         return "Task Title is Required";
                       }else if(value.length<4){
                         return "title must be at least 4 characters";
                       }
                     } ,
                   ),
                   CustomTextFormFiled(
                     controller: descriptionController,
                     hintText: "Enter Description",
                     maxLines: 4,
                     validator: (value){
                       if(value==null||value.isEmpty){
                         return "Task description is Required";
                       }
                     },
                   ),
                   CustomTextFormFiled(
                     controller: dateController,
                     hintText: "Enter Task Date",
                     suffixIcon: Icon(Icons.date_range),
                     validator: (value){
                       if(value==null||value.isEmpty){
                         return "Date is Required";
                       }
                     },
                     readOnly: true,
                     onTap: (){
                       showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2027),
            
                       ).then((d){
                         date=DateFormat.MMMEd().format(d??DateTime.now());
                         dateController.text=date.toString();
                       }).catchError((error){
            
            
            
                       });
                     },
                   ),
                   Row(
                     children: [
                       Expanded(child: CustomTextFormFiled(
                     controller: startTimeController
                     ,hintText: "start Time",
                         readOnly: true,
                         onTap: (){
                           showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time){
                             startTime=time;
                             startTimeController.text=time?.format(context).toString()??"";
                           });
                         },
                         validator: (value){
                           if(value==null||value.isEmpty){
                             return "start time is Required";
                           }
                         },
                       )),
                       SizedBox(width: 10.w,),
                       Expanded(child: CustomTextFormFiled(
                       controller: endTimeController
                       ,hintText: "End Time",
                         readOnly: true,
                         onTap: (){
                           showTimePicker(context: context, initialTime: TimeOfDay.now()).then((time){
                             endTime=time;
                             endTimeController.text=time?.format(context)??"";
                           });
                         },
                         validator: (value){
                           if(value==null||value.isEmpty){
                             return "end time  is Required";
                           }else if(endTime!.isBefore(startTime!)){
                             return "end time must be after start time";
                           }
                         },
                       )),
                     ],
                   ),
            
                 ],
               ))
            ;
  }
}