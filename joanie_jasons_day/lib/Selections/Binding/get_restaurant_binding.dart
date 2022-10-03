import 'package:get/get.dart';
import 'package:joanie_jasons_day/Selections/Controller/get_restaurant_controller.dart';

class GetRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetRestaurantController>(
      () => GetRestaurantController(),
    );
  }
}