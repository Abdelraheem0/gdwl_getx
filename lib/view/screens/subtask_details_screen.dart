// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
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
              controller: _controller.subTaskNameController..text = subTaskName!,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
            ),
            subTaskDetails!.isEmpty
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
              controller: _controller.subTaskDetailsController,
            )
                : TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.subTaskDetailsController
                ..text = subTaskDetails!,
              style: TextStyle(fontSize: 20.0),
            ),
            subTaskDate!.isEmpty
                ? TextFormField(
              onTap: () {
                _controller.pickSubTaskDate();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.date_range,
                  color: Colors.grey,
                ),
                hintText: 'Add date',
              ),
              controller: _controller.subTaskDateController,
              style: TextStyle(fontSize: 18.0),
            )
                : TextFormField(
              onTap: () {
                _controller.pickSubTaskDate();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.date_range,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.subTaskDateController..text = subTaskDate!,
              style: TextStyle(fontSize: 20.0),
            ),
            subTaskTime!.isEmpty
                ? TextFormField(
              onTap: () {
                _controller.pickSubTaskTime();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: Colors.grey,
                ),
                hintText: 'Add time',
              ),
              controller: _controller.subTaskTimeController,
              style: TextStyle(fontSize: 18.0),
            )
                : TextFormField(
              onTap: () {
                _controller.pickSubTaskTime();
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.watch_later_outlined,
                  color: Colors.grey,
                ),
              ),
              controller: _controller.subTaskTimeController..text = subTaskTime!,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}