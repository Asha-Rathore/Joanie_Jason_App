import 'package:get/get.dart';

import '../Controllers/change_older_pass_controller.dart';

class ChangeOlderPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeOlderPasswordController>(
      () => ChangeOlderPasswordController(),
    );
  }
}