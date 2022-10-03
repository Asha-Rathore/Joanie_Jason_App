import 'package:get/get.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/termscondition_privacypolicy_controller.dart';

class TermsConditionPrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsPrivacyPolicyController>(
      () => TermsPrivacyPolicyController(),
    );
  }
}