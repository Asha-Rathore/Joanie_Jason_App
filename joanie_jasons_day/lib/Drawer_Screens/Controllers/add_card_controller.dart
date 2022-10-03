import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Auth_Module/Models/login_model.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/get_card_controller.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Models/add_card_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class AddCardController extends GetxController {
  GetCardDetailController getCardDetailController =
      Get.put(GetCardDetailController());

  final GlobalKey<FormState> cardDetailFormKey = GlobalKey<FormState>();

  late TextEditingController cardNumberController,
      expMonthController,
      expYearController,
      cvvController;

  var cardNumber = "";
  var expMonth = "";
  var expYear = "";
  var cvv = "";

  @override
  void onInit() {
    super.onInit();
    cardNumberController = TextEditingController();
    expMonthController = TextEditingController();
    expYearController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expMonthController.dispose();
    expYearController.dispose();
    cvvController.dispose();
  }

  Future<void> addCard() async {
    final isValid = cardDetailFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    cardDetailFormKey.currentState!.save();

    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['cardNumber'] = cardNumber;
      data['exp_month'] = expMonth;
      data['exp_year'] = expYear;
      data['cvv'] = cvv;
      var response =
          await ApiService.post(NetworkStrings.addCardEndPoint, data, true)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        print(jsonData['message']);
        var obj = AddCardModel.fromJson(jsonData);
        CustomSnackBar("", jsonData['message']);
        stopLoading();

        getCardDetailController.getCardDetail();

        cardNumberController.clear();
        expMonthController.clear();
        expYearController.clear();
        cvvController.clear();
      } else if (response.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        stopLoading();
        CustomSnackBar("", jsonData['message']);
        print(jsonData['message']);
      }
      // print(response.statusCode);
      // print(response.body);
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
  }
}
