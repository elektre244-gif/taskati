import 'package:flutter/material.dart';
import 'package:flutter_application_1/core.dart/widget/app_conistant.dart';
import 'package:flutter_application_1/core.dart/widget/app_constant.dart';
import 'package:flutter_application_1/features.dart/authentication/models/user_model.dart';
import 'package:flutter_application_1/features.dart/home_screen/models/task_model.dart';
import 'package:flutter_application_1/features.dart/home_screen/widgets/custom_app_bar.dart';
import 'package:flutter_application_1/features.dart/home_screen/widgets/custom_filter_bottom.dart';
import 'package:flutter_application_1/features.dart/home_screen/widgets/custom_row_date.dart';
import 'package:flutter_application_1/features.dart/home_screen/widgets/task_list_view.dart';
import 'package:flutter_application_1/features.dart/task_screen/task_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
  int activeIndex=0;
class _HomeScreenState extends State<HomeScreen> {
  @override
    void initState() {
          allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var userData = Hive.box<UserModel>(AppConstants.userBox).getAt(0);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              if (userData != null) CustomAppBar(userData: userData),
              SizedBox(height: 20.h),
              CustomRowDate(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTaskScreen()),
                  );
                  setState(() {});
                },
              ),
                  SizedBox(height: 20.h,),
            Row(
              children: [
                Expanded(child: CustomFilterBottom(title: 'All', isActive: activeIndex==0,
                onTap: (){
                  setState(() {
                    allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList();
                    activeIndex=0;
                  });
                },

                )),
                SizedBox(width: 10.w,),
                Expanded(child: CustomFilterBottom(title: 'ToDo',
                isActive: activeIndex==1,
                  onTap: (){
                  setState(() {
                    allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList().where((e)=>e.statusText.toLowerCase()=="todo").toList();
                    activeIndex=1;
                  });
                  },
                )),
                SizedBox(width: 10.w,),
                Expanded(child: CustomFilterBottom(title: 'Completed',
                isActive: activeIndex==2,
                  onTap: (){
                  setState(() {
                    allTasks=Hive.box<TaskModel>(AppConstant.taskBox).values.toList().where((e)=>e.statusText.toLowerCase()=="completed").toList();
                    activeIndex=2;
                  });
                  },
                )),

              ],
            ),
              SizedBox(height: 20.h),
              TasksListView(),
            ],
          ),
        ),
      ),
    );
  }
}
