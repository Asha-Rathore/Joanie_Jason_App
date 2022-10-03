import 'package:get/get.dart';
import 'package:joanie_jasons_day/Edit_Profile/Controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(
      () => UpdateProfileController(),
    );
  }
}