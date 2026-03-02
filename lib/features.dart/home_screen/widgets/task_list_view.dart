import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/app_constant.dart';
import 'package:flutter_application_1/features.dart/home_screen/models/task_model.dart';
import 'package:flutter_application_1/features.dart/home_screen/widgets/item_task.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
 @override
  void setState(VoidCallback fn) {
        allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return allTasks.isEmpty
        ? Column(
            children: [
              SizedBox(height: 100.h),
              Lottie.asset("assets/loading.json"),
            ],
          )
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    width: double.infinity,
                    color: Colors.black,
                      alignment: Alignment.centerLeft,
                    child: Text(
                      'completed',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    width: double.infinity,
                    color: Colors.black,
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Deleted',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onDismissed:(value){
              if(value== DismissDirection.startToEnd){
               var task= Hive.box<TaskModel>(AppConstant.taskBox).getAt(index);
               task?.statusText="Completed";
               Hive.box<TaskModel>(AppConstant.taskBox).putAt(index, task!);
               setState(() {
                 allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList();
               });
              }else{
                Hive.box<TaskModel>(AppConstant.taskBox).deleteAt(index);
                setState(() {
                  allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList();
                });
              }
            } ,
                  key: UniqueKey(),
                  child: TaskItem(task: allTasks[index]),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: allTasks.length,
            ),
          );
  }
}
