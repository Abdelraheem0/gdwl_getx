// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'package:gdwl_app/shared/validation.dart';
import 'list_screens/create_list_screen.dart';
import '../widgets/done_taks_card.dart';
import '../widgets/tasks_list_builder.dart';
import '../widgets/bottom_navbar/custom_bottom_navbar.dart';
import '../widgets/text_field/form_textfield.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

//  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [
          IconButton(
              onPressed: () {
                getToScreen(CreateList());
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 32.0,
        child: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(
                Container(
                  color: Colors.blue,
              height: 250.h,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FormTextField(
                                hintText: 'New task',
                                controller: _homeController.taskNameController,
                                onTap: () {},
                                prefixIcon: Icons.title,
                                validator: (value) => validateNotEmpty(value)),
                            FormTextField(
                              hintText: 'Details',
                              controller: _homeController.taskDetailsController,
                              prefixIcon: Icons.dehaze,
                              onTap: () {},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FormTextField(
                                  width:
                                      155.w,
                                  hintText: 'Pick date',
                                  controller:
                                      _homeController.taskDateController,
                                  prefixIcon: Icons.calendar_today,
                                  onTap: () {
                                    _homeController.pickTaskDate();
                                  },
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                FormTextField(
                                  width:
                                      155.w,
                                  hintText: 'Pick time',
                                  controller:
                                      _homeController.taskTimeController,
                                  prefixIcon: Icons.watch_later_outlined,
                                  onTap: () {
                                    _homeController.pickTaskTime();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _homeController.addTask();
                              Get.back();
                            }
                          },
                          child: Text(
                            'Add',
                          )),
                    ],
                  ),
                ),
              ),
            ));
          },
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Colors.blue,
              height: 25.h,
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.pageController.animateToPage(index,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0),
                            child: Column(
                              children: [
                                Text(
                                  '${controller.lists[index].name}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                ),
                                controller.currentTab == index
                                    ? Container(
                                        width: 40.w,
                                        height: 4.h,
                                        decoration: ShapeDecoration(
                                          shape: StadiumBorder(),
                                          color: Colors.white,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: controller.lists.length);
                },
              )),
          Expanded(
            child: GetBuilder<HomeController>(builder: (homeController) {
              return PageView.builder(
                controller: homeController.pageController,
                onPageChanged: (int index) {
                  homeController.setCurrentIndex(index: index);
                },
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: homeController.tasks.length < 5
                          ? Column(
                        children: [
                          TasksListBuilder(),
                          homeController.doneTasks.isNotEmpty
                              ? DoneTaskCard()
                              : SizedBox.shrink(),
                        ],
                      )
                          : Column(
                        children: [
                          homeController.doneTasks.isNotEmpty
                              ? DoneTaskCard()
                              : SizedBox.shrink() ,
                          TasksListBuilder(),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: homeController.lists.length,
              );
            }),
          )
        ],
      ),
    );
  }
}
