import 'package:get/get.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_category.dart';

class GetAllCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllCategoryController>(
      () => GetAllCategoryController(),
    );
  }
}