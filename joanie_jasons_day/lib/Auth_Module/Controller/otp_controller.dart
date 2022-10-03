import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Models/otp_verification_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

//final box = GetStorage();

class OtpController extends GetxController {
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  late TextEditingController pinController;

  var code = "";

  var count = 30;
  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    StartTime();
    pinController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pinController.dispose();
  }

  void StartTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        update();
      } else
        _timer.cancel();
      update();
    });
  }

  void reset() {
    _timer.cancel();
    count = 10;
    update();
    StartTime();
    resendCode();
  }

  Future<void> checkOtp() async {
    final isValid = otpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    otpFormKey.currentState!.save();

    dynamic args_response = Get.arguments;

    print("========================");
    print(args_response);
    print("========================");

    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_id'] = args_response[1];
      data['verification_code'] = code;

      var response =
          await ApiService.post(NetworkStrings.otpEndpoint, data, false)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);

      if (response.statusCode == 200) {
        if (args_response[0] == false) {
          Get.offAllNamed(Routes.CHANGEPASSWORD, arguments: args_response[1]);
        } else {
          Get.offAllNamed(Routes.SUCCESS);
        }

        print(jsonData['message']);
        var obj = OtpVerificationModel.fromJson(jsonData);
        CustomSnackBar("OTP Status", jsonData['message']);
      } else if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        stopLoading();
        CustomSnackBar("OTP Status", jsonData['message']);
        print(jsonData['message']);
      }
      print(response.statusCode);
      print(response.body);
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
  }

  Future<void> resendCode() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        dynamic args_response = Get.arguments;

        print("========================");
        print(args_response);
        print("========================");

        final Map<String, dynamic> data = <String, dynamic>{};
        data['user_id'] = args_response[1];

        var response = await ApiService.post(
                NetworkStrings.resendCodeEndpoint, data, false)
            .timeout(Duration(seconds: 120));
        var jsonData = jsonDecode(response!.body);

        if (response.statusCode == 200) {
          print(jsonData['message']);
          var obj = OtpVerificationModel.fromJson(jsonData);
          CustomSnackBar("OTP Status", jsonData['message']);

          Fluttertoast.showToast(
            msg: "OTP: 12345",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 10,
            backgroundColor: AppColors.BLACK_COLOR,
            textColor: AppColors.WHITE_COLOR,
          );
          stopLoading();
        } else if (response.statusCode == 401) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          CustomSnackBar("OTP Status", jsonData['message']);
          print(jsonData['message']);
        }
        print(response.statusCode);
        print(response.body);
      } else {
        stopLoading();
        CustomSnackBar("", "NO_INTERNET_CONNECTION");
        //  stopLoading();
        //AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
        return;
      }
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
  }
}
