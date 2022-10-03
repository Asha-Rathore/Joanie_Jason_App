import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Menu/Models/addorremove_fav_model.dart';
import 'package:joanie_jasons_day/Password/Models/forgot_password_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Bottom_Navigation/Controller/get_all_favorite_controller.dart';
import '../../Utils/Routes/app_pages.dart';

dynamic user_id_response;

class AddOrRemoveFavoriteController extends GetxController{

  GetAllFavoriteController getAllFavoriteController = Get.put(GetAllFavoriteController());

  var productId = "";

  RxBool isPressed = false.obs;

    // Click function for changing the state on click
  // pressed() {
  //   var newVal = true;
  //   if (isPressed) {
  //     newVal = false;
  //     print("pressed true");
  //   } else {
  //     newVal = true;
  //     print("pressed false");
  //   }

  //   // This function is required for changing the state.
  //   // Whenever this function is called it refresh the page with new value
  //     isPressed = newVal;

  //     update();
  // }

  @override
  void onInit(){
    //productId;
    //addOrRemoveFav();
    super.onInit();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
  }

  void addOrRemoveFav() async
  {
    try{
      final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    var response = await ApiService.post(NetworkStrings.addOrRemoveFavoriteEndPoint, data, true).timeout(Duration(seconds: 120));
    var jsonData = jsonDecode(response!.body);
    print("ttttttttttttttttttttt");
    if (response.statusCode == 200) 
    {
      print(jsonData['message']);
      var obj = AddOrRemoveFavoriteModel.fromJson(jsonData);
      if(jsonData['message'] == "Add to Favourites"){
        isPressed.value == true;
      }
      else if(jsonData['message'] == "Favourite deleted"){
        isPressed.value == false;
      }
      CustomSnackBar("", jsonData['message']);
      stopLoading();
      getAllFavoriteController.getAllFavorite();
    }
    else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      } 
    else {
      stopLoading();
      CustomSnackBar("", jsonData['message']);
      print(jsonData['message']);
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    

  }

}