import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdwl_app/controllers/splash_controller.dart';
import 'package:gdwl_app/shared/global_config.dart';
import 'package:gdwl_app/shared/theme.dart';
import 'package:get/get.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Image.asset(
                      imageAssets + 'logo.png',
                      fit: BoxFit.contain,
                    ),

                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
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

