// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'package:gdwl_app/shared/validation.dart';
import 'package:gdwl_app/view/screens/create_list_screen.dart';
import 'package:gdwl_app/view/screens/done_taks_card.dart';
import 'package:gdwl_app/view/screens/rename_list.dart';
import 'package:gdwl_app/view/screens/task_screen.dart';
import 'package:gdwl_app/view/widgets/default_textfield.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var pageController = PageController();

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
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 32.0,
        child: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(Container(
              height: MediaQuery.of(context).size.height / 2.7,
              color: Colors.blue,
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
                            DefaultTextField(
                                hintText: 'New task',
                                controller: _homeController.taskNameController,
                                onTap: () {},
                                prefixIcon: Icons.title,
                                validator: (value) => validateNotEmpty(value)
                            ),
                            DefaultTextField(
                              hintText: 'Details',
                              controller: _homeController.taskDetailsController,
                              prefixIcon: Icons.dehaze,
                              onTap: () {},
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                DefaultTextField(
                                  width: MediaQuery.of(context).size.width /
                                      2.3,
                                  hintText: 'Pick date',
                                  controller: _homeController.taskDateController,
                                  prefixIcon: Icons.calendar_today,
                                  onTap: () {
                                    _homeController.pickTaskDate();
                                  },
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                DefaultTextField(
                                  width: MediaQuery.of(context).size.width /
                                      2.3,
                                  hintText: 'Pick time',
                                  controller: _homeController.taskTimeController,
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
                            if(formKey.currentState!.validate())
                            {
                              _homeController.addTask();
                              Get.back();
                            }
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0),
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
      bottomNavigationBar: Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height / 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        color: Colors.blue,
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxHeight: _homeController
                                          .lists.length <
                                          5
                                          ? double.infinity
                                          : MediaQuery.of(context)
                                          .size
                                          .height /
                                          5,
                                    ),
                                    width: double.infinity,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return GetBuilder<HomeController>(
                                          builder: (controller) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: controller.currentTab == index
                                                    ? Colors.white24
                                                    : Colors.transparent,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    50.0),
                                              ),
                                              child: ListTile(
                                                onTap: () {
                                                  //_homeController.selectCurrentTab(index);
                                                  pageController.animateToPage(
                                                      index,
                                                      duration: Duration(
                                                          seconds:
                                                          1),
                                                      curve: Curves
                                                          .fastOutSlowIn);
                                                  Get.back();
                                                },
                                                title: Text(
                                                  '${controller.lists[index].name}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        );
                                      },
                                      separatorBuilder:
                                          (context, index) =>
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                      itemCount:
                                      _homeController.lists.length,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  getToScreen(CreateList());
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 3.0,
                                    ),
                                    Text(
                                      'Create New List',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        color: Colors.blue,
                        height:
                        MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Text(
                                      'Sort by',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      'My order',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  getToScreen(
                                      RenameList(listName: _homeController.lists[_homeController.currentTab].name!));
                                },
                                child: Text(
                                  'Rename List',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              GestureDetector(
                                onTap: () {

                                },
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delete list',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      'Default list can\'t be deleted ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Delete all complete tasks',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      ));
                },
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: Colors.blue,
                  height: MediaQuery.of(context).size.height / 27,
                  child: GetBuilder<HomeController>(
                    builder: (controller){
                      return              ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                pageController.animateToPage(
                                    index,
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
                                          fontSize: 16.0),
                                    ),
                                    controller.currentTab == index?
                                    Container(
                                      width:
                                      MediaQuery.of(context).size.width / 9,
                                      height:
                                      MediaQuery.of(context).size.height /
                                          170,
                                      decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        color: Colors.white,
                                      ),
                                    ):SizedBox.shrink(),

                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.lists.length);
                    },
                  )

              ),
            ],
          ),

          Expanded(
            child: GetBuilder<HomeController>(
                builder: (homeController){

                  return PageView.builder(
                    controller: pageController,
                    onPageChanged: (int index){
                      homeController.setCurrentIndex(index: index);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TaskScreen(),
                            _homeController.doneTasks.isNotEmpty
                                ? DoneTaskCard()
                                : SizedBox.shrink(),
                          ],
                        ),
                      );
                    },
                    itemCount: homeController.lists.length,
                  );
                }
            ),
          )

        ],
      ),

    );
  }
}
