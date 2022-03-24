// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'package:gdwl_app/view/screens/subtask_details_screen.dart';
import 'package:get/get.dart';

class SubTasksListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: ListTile(
            onTap: (){
              getToScreen(
                  SubTaskDetailsScreen(
                  subTaskName: _controller.subTasks[index].name,
                  subTaskDetails: _controller.subTasks[index].details,
                  subTaskDate: _controller.subTasks[index].date,
                  subTaskTime: _controller.subTasks[index].time)
              );
            },
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.circle_outlined),
            ),
            title: Text('${_controller.subTasks[index].name}'),
            subtitle: Text('${_controller.subTasks[index].details}'),
            trailing:_controller.subTasks[index].date
                .toString() == null &&
                _controller.subTasks[index].time
                    .toString() == null
                ? GestureDetector(
                    onTap: () {},
                    child: Container(
                      width:110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${_controller.subTasks[index].date}',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                              SizedBox(
                                width: 1.0,
                              ),
                              _controller.subTasks[index].date
                                          .toString()
                                          .isNotEmpty &&
                                      _controller.subTasks[index].time
                                          .toString()
                                          .isNotEmpty
                                  ? Text(' , ')
                                  : SizedBox.shrink(),
                              SizedBox(
                                width: 1.0,
                              ),
                              Text(
                                '${_controller.subTasks[index].time}',
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ],
                          )),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        );
      },
      itemCount: _controller.subTasks.length,
    );
  }
}
