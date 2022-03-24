// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import '../widgets/text_field/task_details_textfield.dart';
import 'package:get/get.dart';

class SubTaskDetailsScreen extends StatelessWidget {
  String? subTaskName;
  String? subTaskDetails;
  String? subTaskDate;
  String? subTaskTime;
  SubTaskDetailsScreen(
      {
        required this.subTaskName,
        required this.subTaskDetails,
        required this.subTaskDate,
        required this.subTaskTime,
      });

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
           Get.back();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
          iconSize: 25.0.w,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.delete_forever_outlined,
                color: Colors.redAccent,
                size: 25.0.w,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              controller: _controller.subTaskNameController..text = subTaskName!,
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
            ),
            subTaskDetails!.isEmpty
                ? TaskDetailsTextField(
              controller: _controller.subTaskDetailsController ,
              hintText: 'Add details',)
                : TaskDetailsTextField(
              controller: _controller.subTaskDetailsController,
              initialData: subTaskDetails,),
            subTaskDate!.isEmpty
                ? TaskDetailsTextField(
              controller: _controller.subTaskDateController ,
              hintText: 'Add date',)
                : TaskDetailsTextField(
              controller: _controller.subTaskDateController,
              initialData: subTaskDate,),
            subTaskTime!.isEmpty
                ? TaskDetailsTextField(
              controller: _controller.subTaskTimeController ,
              hintText: 'Add time',)
                : TaskDetailsTextField(
              controller: _controller.subTaskTimeController,
              initialData: subTaskTime,),
          ],
        ),
      ),
    );
  }
}