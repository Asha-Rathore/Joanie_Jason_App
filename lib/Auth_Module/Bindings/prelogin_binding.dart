import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/prelogin_controller.dart';

class PreLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreLoginController>(
      () => PreLoginController(),
    );
  }
}