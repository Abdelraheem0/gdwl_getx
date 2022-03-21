import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getToScreen(Widget screen){
  Get.to(
      screen ,
      duration:const Duration(milliseconds: 400),
  );
}

void getOffScreen(Widget screen){
  Get.off(
    screen ,
    duration:const Duration(milliseconds: 400),
  );
}

void getOffAllScreen(Widget screen){
  Get.offAll(
    screen ,
    duration:const Duration(milliseconds: 400),
  );
}