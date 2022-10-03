import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Models/logout_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class LogoutController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> logOut() async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_id'] = box.read("_id");
      var response =
          await ApiService.post(NetworkStrings.logoutEndpoint, data, true)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      print("++++++++++++++++++++++++");
      print(box.read("_id"));
      print("-------------------------");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(box.read("token"));
        //box.remove("_id");
        box.remove("token");
        box.remove("profile_pic");
        Get.offAllNamed(Routes.PRELOGIN);
        print(jsonData['message']);
        var obj = LogoutModel.fromJson(jsonData);

        CustomSnackBar("Logout Status", jsonData['message']);
      } else if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        stopLoading();
        CustomSnackBar("Logout Status", jsonData['message']);
        print(jsonData['message']);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
  }
}
