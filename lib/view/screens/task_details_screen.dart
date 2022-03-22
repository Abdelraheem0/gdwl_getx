// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
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
                Get.back();
              }else{
              Get.back();
            }
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
          iconSize: 30.0,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(
                Icons.delete_forever_outlined,
                color: Colors.redAccent,
                size: 35.0,
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
              controller: _controller.taskNameController..text = taskName!,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
            ),
            taskDetails!.isEmpty
                ? TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Add details',
              ),
              style: TextStyle(fontSize: 18.0),
              controller: _controller.taskDetailsController,
            )
                : TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.taskDetailsController
                ..text = taskDetails!,
              style: TextStyle(fontSize: 20.0),
            ),
            taskDate!.isEmpty
                ? TextFormField(
              onTap: () {
                _controller.pickTaskDate();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.date_range,
                  color: Colors.grey,
                ),
                hintText: 'Add date',
              ),
              controller: _controller.taskDateController,
              style: TextStyle(fontSize: 18.0),
            )
                : TextFormField(
              onTap: () {
                _controller.pickTaskDate();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.date_range,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.taskDateController..text = taskDate!,
              style: TextStyle(fontSize: 20.0),
            ),
            taskTime!.isEmpty
                ? TextFormField(
              onTap: () {
                _controller.pickTaskTime();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Add time',
              ),
              controller: _controller.taskTimeController,
              style: TextStyle(fontSize: 18.0),
            )
                : TextFormField(
              onTap: () {
                _controller.pickTaskTime();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.taskTimeController..text = taskTime!,
              style: TextStyle(fontSize: 20.0),
            ),

            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add subtask',
                prefixIcon: Icon(
                  Icons.subdirectory_arrow_right,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.subTaskNameController,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}