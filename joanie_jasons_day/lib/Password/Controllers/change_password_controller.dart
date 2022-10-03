import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Password/Models/change_password_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Utils/Routes/app_pages.dart';

class ChangePasswordController extends GetxController{

  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  late TextEditingController passwordController;

  var password = "";

  @override
  void onInit(){
    super.onInit();
    passwordController = TextEditingController();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    passwordController.dispose();
  }

  Future<void> checkPassword()
  async {
    final isValid = changePasswordFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    
    changePasswordFormKey.currentState!.save();

    try{
      dynamic args_response = Get.arguments;
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = args_response;
    data['new_password'] = password;
    var response = await ApiService.post(NetworkStrings.changePasswordEndpoint, data, false).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.LOGIN);
      print(jsonData['message']);
      var obj = ChangePasswordModel.fromJson(jsonData);
      CustomSnackBar("Login Status", jsonData['message']);
    }
    else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      } 
    else {
      stopLoading();
      CustomSnackBar("Login Status", jsonData['message']);
      print(jsonData['message']);
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    
  }

}