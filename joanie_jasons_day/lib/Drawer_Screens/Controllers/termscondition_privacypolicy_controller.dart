import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Models/termscondition_privacypolicy_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

class TermsPrivacyPolicyController extends GetxController {
  RxString cotent = ''.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

//============================================================

//===============================================

  Future<void> GetPrivacy() async {

    try{
      var response =
        await ApiService.get(NetworkStrings.privacyPolicyEndpont, false).timeout(Duration(seconds: 120));
    print(response!.statusCode);

    print(response.body);
    var values = jsonDecode(response.body);
    var obj = TermsNConditionPrivacyPolicyModel.fromJson(values);

    if (response.statusCode == 200) {
      cotent.value = obj.message[0].content;
      print(
          "**************************");
      print(cotent.value);
      print(
          "**************************");
          stopLoading();
    } else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      }else {
      stopLoading();
      CustomSnackBar(obj.status.toString(), "");
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    
    // }
  }

  //===================================================
  Future<void> GetTerms() async {
    try{
      var response =
        await ApiService.get(NetworkStrings.termsConditionEndpont, false).timeout(Duration(seconds: 120));
    print(response!.statusCode);

    print(response.body);
    var values = jsonDecode(response.body);
    var obj = TermsNConditionPrivacyPolicyModel.fromJson(values);

    if (response.statusCode == 200) {
      cotent.value = obj.message[0].content;
      print(
          "**************************");
      print(cotent.value);
      print(
          "**************************");
          stopLoading();
    } else {
      stopLoading();
      CustomSnackBar(obj.status.toString(), "");
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    
    // }
  }
}