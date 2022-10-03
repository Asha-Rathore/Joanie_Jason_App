import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/constants.dart';
import 'Utils/app_strings.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  ).then((_){
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: BotToastInit(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      title: AppStrings.APP_TITLE_TEXT,
      //onGenerateRoute: AppRouter().onGenerateRoute,
      theme: ThemeData(
        fontFamily: Constants.APP_FONT_FAMILY,
        primaryColor: AppColors.primaryColor,
        //primarySwatch: Colors.blue,
      ),
    );
  }
}
