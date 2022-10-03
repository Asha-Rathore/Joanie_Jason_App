import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Past_Orders/Model/get_past_order_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';
import 'package:intl/intl.dart';

import '../../Widgets/get_snackbar.dart';

final box = GetStorage();

class GetPastOrdersController extends GetxController {


  GetPastOrderModel? getPastOrderModel;
static  GetPastOrdersController get p => Get.find();
   
  // RxList<GetOrders> productList = <GetOrders>[].obs;
  

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}

  String convertDate(String date){
    DateTime current = DateTime.parse(date);
    String formattedDate = DateFormat('dd MMM hh:mm').format(current);
    return formattedDate;
  }

  Future<void> getAllProducts() async {

    try{
      print("oooooooooooooooooo");
      showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();

    if (await _connectivityManager.isInternetConnected() == true) {
      var response = await ApiService.get(NetworkStrings.getPastOrdersEndPoint + 
      // "630084db673b4a681d8bc00d",
      box.read("_id"),
      true).timeout(Duration(seconds: 120));
      print("===============api====123=======");
      print(NetworkStrings.getAllProductsEndPoint + box.read("_id"));
      var jsonData = jsonDecode(response!.body);
      if (response.statusCode == 200) {
       var obj = GetPastOrderModel.fromJson(jsonData);
        
        print("past orders response:"+response.body);

        getPastOrderModel =  obj;
        // productList.value = obj.getOrders; 
        // // update();
        // print(productList.value);

       // print(obj);
        stopLoading();
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
      CustomSnackBar("", "NO_INTERNET_CONNECTION");
      return;
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    
  }
}
