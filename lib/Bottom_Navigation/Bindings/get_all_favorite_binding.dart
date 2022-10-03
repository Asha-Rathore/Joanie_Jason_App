import 'package:get/get.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_favorite_controller.dart';

class GetAllFavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAllFavoriteController>(
      () => GetAllFavoriteController(),
    );
  }
}