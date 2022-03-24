// ignore_for_file: list_remove_unrelated_type, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gdwl_app/model/list_model.dart';
import 'package:gdwl_app/model/subtask_model.dart';
import 'package:gdwl_app/model/task_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {


  var taskNameController;
  var taskDetailsController;
  var taskDateController;
  var taskTimeController;
  var listNameController;
  var subTaskNameController;
  var subTaskDetailsController;
  var subTaskDateController;
  var subTaskTimeController;

  PageController pageController = PageController();



  int  currentTab = 0;

  var lists = <ListModel>[
    ListModel(
      id: 1,
      name: 'My Tasks',
    ),
  ];

  List tasks = <TaskModel>[
    TaskModel(
        name: 'Goa Gym',
      details: 'play legs',
      time: '3.00',
      date: '12-03-2022',
        ),
  ];

  List subTasks = <SubTaskModel>[
//    SubTaskModel(
//      name: 'Goa Gym',
//      details: 'play legs',
//      time: '3.00',
//      date: '12-03-2022',
//    ),
  ];

  List doneTasks = <TaskModel>[
    TaskModel(
      name: 'Goa Gym',
    ),
  ];

  DateTime selectedTaskDate = DateTime.now();

  DateTime selectedSubTaskDate = DateTime.now();

  @override
  void onInit() {
    taskNameController= TextEditingController();
     taskDetailsController = TextEditingController();
     taskDateController = TextEditingController();
     taskTimeController = TextEditingController();
     listNameController = TextEditingController();
     subTaskNameController = TextEditingController();
     subTaskDetailsController = TextEditingController();
     subTaskDateController = TextEditingController();
     subTaskTimeController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    taskNameController.dispose();
    taskDetailsController.dispose();
    taskDateController.dispose();
    taskTimeController.dispose();
    listNameController.dispose();
    subTaskNameController.dispose();
    subTaskDetailsController.dispose();
    subTaskDateController.dispose();
    subTaskTimeController.dispose();
    super.onClose();
  }

  void setCurrentIndex({required int index}){
    currentTab = index;
    update();
  }

  Future<void> pickTaskDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedTaskDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    );
    selectedTaskDate = pickedDate!;
    taskDateController.text =
        DateFormat('dd-MM-yyyy')
            .format(selectedTaskDate)
            .toString();
  }

  Future<void> pickSubTaskDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedSubTaskDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    );
    selectedSubTaskDate = pickedDate!;
    subTaskDateController.text =
        DateFormat('dd-MM-yyyy')
            .format(selectedSubTaskDate)
            .toString();
  }

  Future<void> pickTaskTime() async{
    var val =  await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    taskTimeController.text =
        val!.format(Get.context!);
  }

  Future<void> pickSubTaskTime() async{
    var val =  await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    subTaskTimeController.text =
        val!.format(Get.context!);
  }

  void resetTaskControllers() {
    taskNameController.text = '';
    taskDetailsController.text = '';
    taskTimeController.text = '';
    taskDateController.text = '';
  }

  void resetSubTaskControllers() {
    subTaskNameController.text = '';
    subTaskDetailsController.text = '';
    subTaskTimeController.text = '';
    subTaskDateController.text = '';
  }

  void resetListController(){
    listNameController.text = '';
  }

  void addTask() {
    tasks.add(TaskModel(
      name: taskNameController.text,
      details: taskDetailsController.text,
      time: taskTimeController.text,
      date: taskDateController.text,
      status: 'new',
    ));
    resetTaskControllers();
  }

  void addSubTask() {
    subTasks.add(
        SubTaskModel(
      name: subTaskNameController.text,
      details: subTaskDetailsController.text,
      time: subTaskTimeController.text,
      date: subTaskDateController.text,
      status: 'new',
    ));
    resetSubTaskControllers();
  }

  void addList() {
      lists.add(ListModel(
        name: listNameController.text,
      ));
      listNameController.text = '';
  }

  

//  selectCurrentTab(int index){
//    List selectedIndex = [currentTab];
//    final isSelected = selectedIndex.contains(index);
//    currentTab.value = index;
//    if (isSelected == false) {
//      selectedIndex.add(index);
//    }
//  }

}
