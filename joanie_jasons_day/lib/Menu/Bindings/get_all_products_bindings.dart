import 'package:get/get.dart';
import 'package:joanie_jasons_day/Menu/Controllers/get_all_products_controller.dart';

class GetAllProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllProductsController>(
      () => GetAllProductsController(),
    );
  }
}