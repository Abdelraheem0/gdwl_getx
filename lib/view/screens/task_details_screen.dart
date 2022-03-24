// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/theme.dart';
import '../widgets/text_field/task_details_textfield.dart';
import 'package:get/get.dart';

class TaskDetailsScreen extends StatelessWidget {
  String? taskName;
  String? taskDetails;
  String? taskDate;
  String? taskTime;
  TaskDetailsScreen(
      {
        required this.taskName,
        required this.taskDetails,
        required this.taskDate,
        required this.taskTime,
        });

//  var taskNameController = TextEditingController();
//  var taskDetailsController = TextEditingController();
//  var taskDateController = TextEditingController();
//  var taskTimeController = TextEditingController();
//  var subTaskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if(_controller.subTaskNameController.text.isNotEmpty)
              {
                _controller.addSubTask();
                _controller.resetSubTaskControllers();
                _controller.resetTaskControllers();
                Get.back();
              }else{
              _controller.resetTaskControllers();
              Get.back();
            }
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
          iconSize: 25.0.w,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                // Delete Task
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
                contentPadding: EdgeInsets.zero
              ),
              controller: _controller.taskNameController..text = taskName!,
              style: MyTheme.getTextTheme().headline1!.copyWith(color: Colors.black),
            ),
            taskDetails!.isEmpty
                ? TaskDetailsTextField(
              controller: _controller.taskDetailsController ,
              hintText: 'Add details',
              prefixIcon: Icons.description_outlined,
            )
                : TaskDetailsTextField(
              controller: _controller.taskDetailsController,
              initialData: taskDetails,
              prefixIcon: Icons.description_outlined,
            ),
            taskDate!.isEmpty
                ? TaskDetailsTextField(
              controller: _controller.taskDateController ,
              hintText: 'Add date',
              prefixIcon: Icons.date_range,
            )
                : TaskDetailsTextField(
              controller: _controller.taskDateController,
              initialData: taskDate,
              prefixIcon: Icons.date_range,
            ),
            taskTime!.isEmpty
                ? TaskDetailsTextField(
              controller: _controller.taskTimeController ,
              hintText: 'Add time',
              prefixIcon: Icons.watch_later_outlined,
            )
                : TaskDetailsTextField(
              controller: _controller.taskTimeController,
              initialData: taskTime,
              prefixIcon: Icons.watch_later_outlined,
            ),

            TextFormField(
              decoration: InputDecoration(
                hintText: 'Add subtask',
                prefixIcon: Icon(
                  Icons.subdirectory_arrow_right,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.subTaskNameController,
            ),
          ],
        ),
      ),
    );
  }
}