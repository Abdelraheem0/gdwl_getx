// ignore_for_file: prefer_const_constructors

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:get/get.dart';

class DoneTaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    HomeController _homeController = Get.find();

    return ExpansionTileCard(
      title: Text('Completed'),
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                  },
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check,
                      )),
                  title: Text(
                    '${_homeController.doneTasks[index].name}',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                )
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: double.infinity,
              height: 1.0,
            );
          },
          itemCount:_homeController.doneTasks.length,
        ),
      ],
    );
  }
}
