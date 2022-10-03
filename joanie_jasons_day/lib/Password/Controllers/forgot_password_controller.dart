import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Password/Models/forgot_password_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Utils/Routes/app_pages.dart';

dynamic user_id_response;

class ForgotPasswordController extends GetxController{

  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = "";

  @override
  void onInit(){
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    emailController.dispose();
  }

  String? validateEmail(String value)
  {
    if(!GetUtils.isEmail(value)){
      return "Provide valid Email";
    }
    return null;
  }

  void checkValidEmail() async
  {
    final isValid = forgotPasswordFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    forgotPasswordFormKey.currentState!.save();

    try{
      final Map<String, dynamic> data = <String, dynamic>{};
    data['user_email'] = email;
    var response = await ApiService.post(NetworkStrings.forgotPasswordEndpoint, data, false).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    if (response.statusCode == 200) 
    {
      print(jsonData['message']);
      var obj = ForgotPasswordModel.fromJson(jsonData);
      user_id_response = obj.data.userId;
      Get.toNamed(Routes.OTPVERIFICATION, arguments: [false, user_id_response]);
      CustomSnackBar("Login Status", jsonData['message']);

      Fluttertoast.showToast(
        msg: "OTP: 12345",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: AppColors.BLACK_COLOR,
        textColor: AppColors.WHITE_COLOR,
      );
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