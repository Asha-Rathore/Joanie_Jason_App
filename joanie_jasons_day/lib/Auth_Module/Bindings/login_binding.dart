import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}