// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import '../../screens/list_screens/create_list_screen.dart';
import 'custom_bottomsheet_tile.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {

//  PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {

    HomeController _homeController = Get.find();

    return Container(
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
                                                  _homeController.pageController.animateToPage(
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
                      MediaQuery.of(context).size.height / 3.3,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            CustomBottomSheetTile(
                                onTap: (){},
                                title: 'Sort by',
                              subTitle: 'My order',
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            CustomBottomSheetTile(
                                onTap: (){},
                                title: 'Rename List',
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            CustomBottomSheetTile(
                                onTap: (){},
                                title: 'Delete List',
                              subTitle: 'Can\'t delete default list',
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            CustomBottomSheetTile(
                                onTap: (){},
                                title: 'Delete all complete tasks'
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
    );
  }
}
