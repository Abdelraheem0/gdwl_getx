// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/shared/user_binding.dart';
import 'package:get_storage/get_storage.dart';

import 'view/screens/splash_sreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  UserBinding().dependencies();
  runApp(
    ScreenUtilInit(
        builder: () => SplashScreen()
    )
  );
}

