import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Models/get_sub_category_model.dart';
import 'package:joanie_jasons_day/Menu/Controllers/get_all_products_controller.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class GetSubCategoryController extends GetxController with GetSingleTickerProviderStateMixin{
  
  List<Message> categoryList = <Message>[];

  final GetAllProductsController getAllProductsController =
      Get.put(GetAllProductsController());

  // late TabController tabController;

 // RxInt length = 0.obs;
  

  @override
  void onInit() {
    // categoryList;
    // length;
    // getAllSubCategory(box.read("category_id"));
    // tabController = TabController(
    //   //length: length.value,
    //   length: categoryList.length,
    //   vsync: this,
    // );
    // print("LIST LENGTH");
    // print(categoryList.length);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //tabController.dispose();
  }

  Future<void> getAllSubCategory(String? parent_id) async {
    try{
      showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    // dynamic args_response = Get.arguments;
    // args_response;
    // print("COFFEE ARGUMENTS");
    // print(args_response[0]);
    // print(Get.arguments);
    //String parent_id = box.read("category_id");
    if (await _connectivityManager.isInternetConnected() == true) {
      var response = await ApiService.get(NetworkStrings.getSubCategoryEndPoint + parent_id!, true).timeout(Duration(seconds: 120));
      print("aaaaaaaaaaaaaaaa");
      print(box.read("category_id"));
      print("===============api===========");
      print(response!.body);
      print(NetworkStrings.getSubCategoryEndPoint + box.read("category_id"));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(jsonData['message']);
        var obj = GetSubCategoryModel.fromJson(jsonData);

        print(obj);
        categoryList = obj.message; 
        update();
        getAllProductsController.getAllProducts(obj.message[0].id!);
        update();
        print(categoryList.length);
        print("============Message Length=======");
        // length.value = obj.message.length;
        // print(length.value);

        print(obj);
        stopLoading();
      //      tabController=TabController(
      // //length: length.value,
      // length: categoryList.length,
      // vsync: this,
    // );
        //update();
      } 
      else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      }
      else {
        stopLoading();
        print(jsonData['message']);
      }
    }
    else {
      stopLoading();
   
      //SnackBar("NO_INTERNET_CONNECTION");
      return;
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    
  }
}
