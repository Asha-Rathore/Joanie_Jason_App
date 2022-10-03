import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Menu/Models/get_all_products_models.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Widgets/get_snackbar.dart';

final box = GetStorage();

class GetAllProductsController extends GetxController {
  
  RxList<Message> productList = <Message>[].obs;
  

  @override
  void onInit() {
    //getAllProducts(box.read("Sub_category_id"));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getAllProducts(String parentId) async {

    try{
      showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();

    if (await _connectivityManager.isInternetConnected() == true) {
      var response = await ApiService.get(NetworkStrings.getAllProductsEndPoint + parentId, true).timeout(Duration(seconds: 120));
      print("===============api====123=======");
      print(NetworkStrings.getAllProductsEndPoint + parentId);
      var jsonData = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        var obj = GetAllProductsModel.fromJson(jsonData);
        print(obj.data![1].productName);
        
        print(obj);
        productList.value = obj.data!; 
        update();
        print(productList.value);

        print(obj);
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
