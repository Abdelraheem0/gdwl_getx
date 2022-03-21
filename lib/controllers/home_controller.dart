// ignore_for_file: list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:gdwl_app/model/list_model.dart';
import 'package:gdwl_app/model/task_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var taskNameController = TextEditingController();
  var taskDetailsController = TextEditingController();
  var taskDateController = TextEditingController();
  var taskTimeController = TextEditingController();

  var listNameController = TextEditingController();

  var currentTab = 0.obs;

  var lists = <ListModel>[
    ListModel(
      id: 1,
      name: 'My Tasks',
    ),
  ].obs;

  var tasks = <TaskModel>[
    TaskModel(
        id: 1,
        name: 'Goa Gym',
        listId: 1,
        details: 'play legs',
        time: '12:15',
        date: '25,feb 2022',
        status: 'new'),
  ].obs;

  var selectedDate = DateTime.now().obs;

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    );
    selectedDate.value = pickedDate!;
  }

  resetTextController() {
    taskNameController.text = '';
    taskDetailsController.text = '';
    taskTimeController.text = '';
    taskDateController.text = '';
  }

  addTask() {
    tasks.add(TaskModel(
      name: taskNameController.text,
      details: taskDetailsController.text,
      time: taskTimeController.text,
      date: taskDateController.text,
      status: 'new',
    ));
    resetTextController();
  }

  addList() {
      lists.add(ListModel(
        name: listNameController.text,
      ));
      listNameController.text = '';
  }

  selectCurrentTab(int index){
    List selectedIndex = [currentTab];
    final isSelected = selectedIndex.contains(index);
    currentTab.value = index;
    if (isSelected == false) {
      selectedIndex.add(index);
    }
  }

}
