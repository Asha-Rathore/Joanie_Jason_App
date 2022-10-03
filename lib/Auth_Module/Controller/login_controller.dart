import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Auth_Module/Models/login_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  var email = "";
  var password = "";

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // emailController.dispose();
    // passwordController.dispose();
  }

  Future<void> checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();

    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_email'] = email;
      data['user_password'] = password;
      var response =
          await ApiService.post(NetworkStrings.loginEndpoint, data, false)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.SELECTSTORES);
        print(jsonData['message']);
        var obj = LoginModel.fromJson(jsonData);
        box.write("token", obj.token);
        box.write("_id", obj.data.id);

        box.write("full_name", obj.data.userName);
        print(box.read("full_name"));

        box.write("user_email", obj.data.userEmail);
        print(box.read("user_email"));

        box.write("number", obj.data.number);
        print(box.read("number"));

        print(obj.token);
        CustomSnackBar("Login Status", jsonData['message']);
      } else if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        stopLoading();
        CustomSnackBar("Login Status", jsonData['message']);
        print(jsonData['message']);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }

    // print(response.statusCode);
    // print(response.body);
  }
}
