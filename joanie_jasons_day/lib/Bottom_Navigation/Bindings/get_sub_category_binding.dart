import 'package:get/get.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_sub_category_controller.dart';

class GetSubCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetSubCategoryController>(
      () => GetSubCategoryController(),
    );
  }
}