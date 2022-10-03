import 'package:get/get.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/logout_controller.dart';

class LogoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoutController>(
      () => LogoutController(),
    );
  }
}