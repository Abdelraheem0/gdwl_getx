import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdwl_app/controllers/splash_controller.dart';
import 'package:gdwl_app/shared/global_config.dart';
import 'package:gdwl_app/shared/theme.dart';
import 'package:get/get.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme().getTheme(),
      home: Scaffold(
          body: GetBuilder<SplashController>(
            init: SplashController(),
            builder: (splashController) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 280.w,
                    child: Image.asset(
                      imageAssets + 'logo.png',
                      fit: BoxFit.contain,
                    ),

                  ),
                  SizedBox(height: 60.w),
                  SizedBox(
                    width: 160.w,
                    height: 2,
                    child: const LinearProgressIndicator(
                      backgroundColor: Colors.blue,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}

