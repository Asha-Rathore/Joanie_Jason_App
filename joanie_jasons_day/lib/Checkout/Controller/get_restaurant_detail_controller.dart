import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Checkout/Model/get_restaurant_detail_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';


final box = GetStorage();

class GetRestaurantDetailsController extends GetxController {

  Message restaurantDetails = Message();
  
  @override
  void onInit() {
    //getProductDetails(box.read("product_id"));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getRestaurantDetails(String? productId) async {

    try{
      print("hhhhhhhhhhhhhhhhhhhhhhhhh");
    showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      print("ggggggggggggggg");
      var response = await ApiService.get(NetworkStrings.getRestaurantDetailEndPoint + box.read("restaurant_id"), true).timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("jjjjjjjjjjjjjjjjjj");
        print(jsonData['message']);
        var obj = GetRestaurantDetailModel.fromJson(jsonData);
        // print(obj);

        restaurantDetails = obj.message!;
        update();
        stopLoading();
        
        //SnackBar("Logout Status", jsonData['message']);
      } 
      else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      }
      else {
        print("eeeeeeeeeeeeeeeeee");
        stopLoading();
        //SnackBar("Logout Status", jsonData['message']);
        print(jsonData['message']);
      }
    }
    else {
      stopLoading();
      CustomSnackBar("", "NO_INTERNET_CONNECTION");
      //  stopLoading();
      //AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    
    
  }
}
