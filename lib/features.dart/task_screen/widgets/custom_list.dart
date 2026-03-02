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
    return           Scaffold() ;
  }}