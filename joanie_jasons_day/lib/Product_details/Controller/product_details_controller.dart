import 'dart:async';
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Product_details/Model/product_detail_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class ProductDetailsController extends GetxController {

  Message productDetails = Message();
  var price;
  var actualPrice;
  int quantity = 1;
  
  @override
  void onInit() {
    getProductDetails(box.read("product_id"));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void add() {
      quantity++;
      update();
      price = actualPrice * quantity;
      update();
      print("pppppppppppppp");
      print(actualPrice * quantity);

  }

  void minus() {
      if (quantity == 1) {
        Fluttertoast.showToast(
          msg: "Removed From Cart",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 10,
          backgroundColor: AppColors.BLACK_COLOR,
          textColor: AppColors.WHITE_COLOR,
        );
        Get.back();
      } else {
        quantity--;
        update();
        price = price - actualPrice;
        update();
        print("ppppppppppppphhhhhhhhhp");
        print(price);
      }
  }

  Future<ProductDetailsModel?> getProductDetails(String? productId) async {

    try{
      print("Controlleru  uuuuuuuuuuuuuuuuuuuuuuuuuuu");
    showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      
      var response = await ApiService.get(NetworkStrings.getProductDetailsEndPoint + productId!, true).timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      
      if (response.statusCode == 200) {
        
        print(jsonData['message']);
        var obj = ProductDetailsModel.fromJson(jsonData);
        // print(obj);

        productDetails = obj.message!;
        price = obj.message!.productPrice!;
        actualPrice = obj.message!.productPrice!;
        update();
        stopLoading();
        
        //SnackBar("Logout Status", jsonData['message']);
      } else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      }
      else {
        
        stopLoading();
        //SnackBar("Logout Status", jsonData['message']);
        print(jsonData['message']);
      }
    }
    else {
      print("iiiiiiiiiiiiiiiiii");
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
