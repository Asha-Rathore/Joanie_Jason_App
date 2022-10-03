import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Widgets/app_logo.dart';
import 'package:joanie_jasons_day/Widgets/app_template.dart';

import '../../Auth_Module/Screens/prelogin.dart';

final box = GetStorage();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => checkToken() 
      // () => Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const PreLogin(),
      //   ),
      // ),
    );
  }
  checkToken(){
    if(box.read("token") != null){
      Get.offAllNamed(Routes.SELECTSTORES);
    }
    else{
      Get.offAllNamed(Routes.PRELOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(40.0),
                child: AppLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}