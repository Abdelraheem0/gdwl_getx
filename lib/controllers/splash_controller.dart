import 'package:flutter/material.dart';
import 'package:gdwl_app/shared/get_navigate_functions.dart';
import 'package:gdwl_app/view/screens/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    splashTimer(HomeScreen());
  }

  Future<void> splashTimer(Widget screen) async {
    await Future.delayed(
        const Duration(milliseconds: 2000) ,
            () => getOffAllScreen(screen));
  }

}