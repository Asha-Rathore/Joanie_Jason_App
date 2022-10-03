import 'package:get/get.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_profile_controller.dart';

class GetProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetProfileController>(
      () => GetProfileController(),
    );
  }
}