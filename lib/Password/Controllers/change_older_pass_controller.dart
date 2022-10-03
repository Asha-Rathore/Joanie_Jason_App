import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Password/Models/change_older_password_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Utils/Routes/app_pages.dart';

final box = GetStorage();
class ChangeOlderPasswordController extends GetxController{

  final GlobalKey<FormState> changeOlderPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController passwordController, newPasswordController;

  var password = "";
  var newpassword = "";

  @override
  void onInit(){
    super.onInit();
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    passwordController.dispose();
    newPasswordController.dispose();
  }

  void changePassword()
  async {
    final isValid = changeOlderPasswordFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    
    changeOlderPasswordFormKey.currentState!.save();

    try{
      final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = box.read('_id');
    data['old_password'] = password;
    data['new_password'] = newpassword;
    var response = await ApiService.put(NetworkStrings.changeOlderPasswordEndpoint, data, true).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);

    if (response.statusCode == 200) {
      Get.toNamed(Routes.SELECTSTORES);
      print(jsonData['message']);

      var obj = ChangeOlderPasswordModel.fromJson(jsonData);
      CustomSnackBar("Password Status", jsonData['message']);

    } 
    else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      }
    else {
      stopLoading();
      CustomSnackBar("Password Status", jsonData['message']);
      print(jsonData['message']);
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }

    

  }

}