import 'package:gdwl_app/controllers/home_controller.dart';
import 'package:gdwl_app/controllers/splash_controller.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(HomeController());
  }
}