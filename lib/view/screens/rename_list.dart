// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class RenameList extends StatelessWidget {
  String listName;

  RenameList({required this.listName});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Rename List'),
              leading: IconButton(
                onPressed: (){
                  homeController.currentTab = 0;
                  getOffAllScreen(HomeScreen());
                  },
                icon: Icon(Icons.arrow_back),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if(homeController.listNameController.text.isEmpty)
                      {
                        return ;
                      }else{
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
                controller: homeController.listNameController..text = listName,
              ),
            ),
          );
        }
    );
  }
}
