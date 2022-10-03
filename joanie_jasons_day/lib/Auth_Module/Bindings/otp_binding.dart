import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
  }
}