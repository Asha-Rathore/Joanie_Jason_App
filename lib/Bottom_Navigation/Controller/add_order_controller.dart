// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Models/add_order_model.dart';
import 'package:joanie_jasons_day/Product_details/Controller/add_to_cart_controller.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class AddOrderController extends GetxController {
  // final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  AddToCartController addToCartController = Get.put(AddToCartController());

  List<String> addOrderList = <String>[];
  List<Map<String, String>> addOrderl = <Map<String, String>>[];

  List addOrderProductIds() {
    
    String temp;
    for (int i = 0; i < addToCartController.addtoCartList.length; i++) {
      print("dddddddddd");
      var kuchbhi = {
        "orderPrice": orderPrice,
          "products": addOrderList,
      };
      // print(addToCartController.addtoCartList[i].productId);
      // print(addOrderList.length);
      // print(addToCartController.addtoCartList.length);
      // int ength = addToCartController.addtoCartList.length;
      // addOrderList.length = ength;
      addOrderList.add(addToCartController.addtoCartList[i].productId!);
      update();
      print("lllllllllllllllll");
      print(addOrderList[i]);
      
      //addOrderList[i] = temp;
    }
    return addOrderList;
  }

  var length;

  //late TextEditingController emailController, passwordController;

  var orderPrice = "";

  @override
  void onInit() {
    super.onInit();
    // emailController = TextEditingController();
    // passwordController = TextEditingController();
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

  Future<void> addOrder() async {
    // final isValid = loginFormKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    // loginFormKey.currentState!.save();

    //length = addToCartController.addtoCartList.length;

    try {
      addOrderProductIds();
      // print("ffffffffffffffffff");
      // print(addToCartController.addtoCartList[0].productId);
      for(int i = 0; i < addOrderList.length; i++){
        addOrderl.add({
        "productId": addOrderList[i],
      });
      }
      // Map<String, String> time = <String, String>;
      // addOrderl.add(time);
      var data = await http.post(Uri.parse("http://server.appsstaging.com:3013/api/addOrder"),
          body: jsonEncode({
            "orderPrice": orderPrice,
            "products": addOrderl,
          }),
          headers: {
            "Accept": 'application/json',
            "Authorization": 'Bearer ' + await box.read("token"),
            "Content-Type": "application/json"
            // "Content-Type": "application/json",
            // "Authorization": "Bearer" + await box.read("token")
          });

      // final Map<String, dynamic> data = <String, dynamic>{};
      // data['orderPrice'] = orderPrice;
      // data['productId'] = productId;

      // var data = jsonEncode(
      //     {
      //     "orderPrice": orderPrice,
      //     "products": addOrderList
      //   });
      // var response =
      //     await ApiService.post(NetworkStrings.addOrderEndPoint, data, true)
      //         .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(data.body);
      if (data.statusCode == 200) {
        Get.offAllNamed(Routes.CHECKOUT);
        print(jsonData['message']);
        var obj = AddOrderModel.fromJson(jsonData);
        CustomSnackBar("", jsonData['message']);
        print("chal rha hai");
        Get.toNamed(Routes.BOTTOMNAVBAR);
      } else if (data.statusCode == 401) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        print(data.body);
        stopLoading();
        // CustomSnackBar("", jsonData['message']);
        print(jsonData['message']);
        print("nai chal rha");
      }
      // print(response.statusCode);
      // print(response.body);
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
  }
}
