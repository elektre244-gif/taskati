import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomList extends StatefulWidget {
 CustomList({super.key});

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
    List<Color> taskColors=[
    Colors.indigo,
    Colors.green,
    Colors.purple,

  ];

  int activeIndex=0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: 50.h,
                  child: ListView.separated(
                  scrollDirection: Axis.horizontal
                  ,itemBuilder: (context,index)=>InkWell(
                    onTap: (){
                      setState(() {
                        activeIndex=index;
            
                      });
                    },
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: taskColors[index],
                      child:activeIndex==index? Icon(Icons.check,color: Colors.white,):null,
                    ),
                  ), separatorBuilder: (context,index)=>SizedBox(width: 10.h,), itemCount: taskColors.length),
                )
            ;
  }
}