import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/Custom_text_form_field.dart';
import 'package:flutter_application_1/core.dart/widget/custom_bottom.dart';
import 'package:flutter_application_1/features.dart/home_screen/models/task_model.dart';
import 'package:flutter_application_1/features.dart/task_screen/widgets/appBar_info.dart';
import 'package:flutter_application_1/features.dart/task_screen/widgets/custom_list.dart';
import 'package:flutter_application_1/features.dart/task_screen/widgets/form_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<TaskScreen> {
  var formKey=GlobalKey<FormState>();

  List<Color> taskColors=[
    Colors.indigo,
    Colors.green,
    Colors.purple,

  ];
  int activeIndex=0;

  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var dateController=TextEditingController();
  var startTimeController=TextEditingController();
  var endTimeController=TextEditingController();
  String? date;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              spacing: 20.h,
              children: [
                AppbarInfo(),
               FormValidator(),
            
               CustomList(),
            
            
              CustomBottom(name: "Create Task",
                onPressed: (){
            
                  if( formKey.currentState?.validate()??false){
                    allTasks.add(TaskModel(title: titleController.text,
                        startTime: startTimeController.text??"", endTime: endTimeController.text??"",
                        description: descriptionController.text,
                        statusText: "ToDo", color: taskColors[activeIndex]));
                    Navigator.pop(context);
                  }
            
                },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}