// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CustomBottomSheetTile extends StatelessWidget {
  Function? onTap;
  String? title;
  String? subTitle;

  CustomBottomSheetTile({
    required this.onTap ,
    required this.title ,
    this.subTitle = '' ,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          subTitle == ''
              ? SizedBox.shrink()
              : Text(
            '$subTitle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
