// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TaskDetailsTextField extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  String? initialData;
  IconData? prefixIcon;

  TaskDetailsTextField({ required this.controller, this.hintText = '' , this.initialData = '' ,required this.prefixIcon});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: hintText != ''
          ? InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
        hintText: '$hintText',
      )
          : InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey,
        ),
      ),
      style: TextStyle(fontSize: 18.sp),
      controller: hintText != ''
          ? controller
          : controller..text = '$initialData',
    );
  }
}
