import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';

class CustomSnackBar {
  CustomSnackBar(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      backgroundColor: AppColors.secondaryColor,
      colorText: AppColors.WHITE_COLOR,
      snackPosition: SnackPosition.TOP,
    );
  }
}
