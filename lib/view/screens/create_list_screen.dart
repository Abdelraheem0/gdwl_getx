// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'package:gdwl_app/view/screens/home_screen.dart';
import 'package:get/get.dart';


class CreateList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (homeController) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Create New List'),
            actions: [
               TextButton(
                    onPressed: () {
                      if(homeController.listNameController.text.isEmpty)
                        {
                          return ;
                        }else{
                        homeController.addList();
                        getOffAllScreen(HomeScreen());
                      }
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(color: Colors.white),
                    )),
            ],
          ),
          body:   Padding(
              padding: const EdgeInsets.all(8.0),
              child:TextFormField(
                    controller: homeController.listNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter List Name',
                    ),
                  ),
            ),
        );
      }
    );
  }
}
