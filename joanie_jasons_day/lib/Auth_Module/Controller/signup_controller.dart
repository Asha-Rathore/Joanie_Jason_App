import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Auth_Module/Models/signup_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Utils/Routes/app_pages.dart';

final box = GetStorage();
dynamic user_id_response;

class SignUpController extends GetxController {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController fullNameController,
      emailController,
      passwordController,
      confirmPasswordController,
      phoneNumberController;

  var fullName = "";
  var email = "";
  var password = "";
  var confirmPassword = "";
  var phoneNumber = "";

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }

  Future<void> checkSignUp() async {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signupFormKey.currentState!.save();

    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_name'] = fullName;
      data['user_email'] = email;
      data['user_password'] = password;
      data['number'] = phoneNumber;

      var response =
          await ApiService.post(NetworkStrings.signupEndpoint, data, false)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);

      if (response.statusCode == 200) {
        print(jsonData['message']);
        var obj = SignupModel.fromJson(jsonData);
        user_id_response = obj.data.userId;
        Get.toNamed(Routes.OTPVERIFICATION,
            arguments: [true, user_id_response]);
        print(obj.data.userId);

        CustomSnackBar("Signup Status", jsonData['message']);

        Fluttertoast.showToast(
          msg: "OTP: 12345",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: AppColors.BLACK_COLOR,
          textColor: AppColors.WHITE_COLOR,
        );
      } else if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        stopLoading();
        CustomSnackBar("Signup Status", jsonData['message']);
        print(jsonData['message']);
      }
      print(response.statusCode);
      print(response.body);
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
  }
}
