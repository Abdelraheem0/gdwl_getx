// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TaskDetailsTextField extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  String? initialData;

  TaskDetailsTextField({ required this.controller, this.hintText = '' , this.initialData = ''});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: hintText != ''
          ? InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.description_outlined,
          color: Colors.grey,
        ),
        hintText: '$hintText',
      )
          : InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.description_outlined,
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
