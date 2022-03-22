// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'package:gdwl_app/view/screens/subtask_screen.dart';
import 'package:gdwl_app/view/screens/task_details_screen.dart';
import 'package:get/get.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HomeController _homeController = Get.find();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) => Column(
        children: [
          ListTile(
            onTap: (){
              getToScreen(
                  TaskDetailsScreen(
                taskName: _homeController.tasks[index].name,
                taskDetails: _homeController.tasks[index].details,
                taskTime: _homeController.tasks[index].time,
                taskDate: _homeController.tasks[index].date,
              ));
            },
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              onPressed: (){
              },
              icon: Icon(Icons.circle_outlined),
            ),
            title: Text(
              '${_homeController.tasks[index].name}',
            ),
            subtitle:
            Text('${_homeController.tasks[index].details}'),
            trailing: _homeController.tasks[index].date
                .toString()
                .isEmpty &&
                _homeController.tasks[index].time
                    .toString()
                    .isEmpty
                ? SizedBox.shrink()
                : GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.34,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(40.0),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Text(
                          '${_homeController.tasks[index].date}',
                          style:
                          TextStyle(fontSize: 10.0),
                        ),
                        SizedBox(
                          width: 1.0,
                        ),
                        _homeController.tasks[index].date
                            .toString()
                            .isNotEmpty &&
                            _homeController
                                .tasks[index].time
                                .toString()
                                .isNotEmpty
                            ? Text(' , ')
                            : SizedBox.shrink(),
                        SizedBox(
                          width: 1.0,
                        ),
                        Text(
                          '${_homeController.tasks[index].time}',
                          style:
                          TextStyle(fontSize: 10.0),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          SubTaskScreen(),
        ],
      ),
      itemCount: _homeController.tasks.length,
    );
  }
}
