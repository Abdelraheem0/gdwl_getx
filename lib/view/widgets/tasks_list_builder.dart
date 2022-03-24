// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'subtasks_list_builder.dart';
import 'package:gdwl_app/view/screens/task_details_screen.dart';
import 'package:get/get.dart';

class TasksListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HomeController _homeController = Get.find();

    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
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
                width:110.w,
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
                          TextStyle(fontSize: 10.sp),
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
                          TextStyle(fontSize: 10.sp),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          SubTasksListBuilder(),
        ],
      ),
      itemCount: _homeController.tasks.length,
    );
  }
}
