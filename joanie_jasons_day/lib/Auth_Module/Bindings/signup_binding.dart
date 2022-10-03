import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
  }
}