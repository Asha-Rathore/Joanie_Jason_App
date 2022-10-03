import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Models/get_all_favorite_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class GetAllFavoriteController extends GetxController {
  RxList<Favourites> allFavoriteList = <Favourites>[].obs;

  @override
  void onInit() {
    getAllFavorite();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getAllFavorite() async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();

      if (await _connectivityManager.isInternetConnected() == true) {
        var response =
            await ApiService.get(NetworkStrings.getAllFavoriteEndPoint, true)
                .timeout(Duration(seconds: 120));
        var jsonData = jsonDecode(response!.body);
        if (response.statusCode == 200) {
          print(jsonData['message']);
          var obj = GetAllFavoriteModel.fromJson(jsonData);
          // print(obj);

          allFavoriteList.value = obj.favourites!;
          update();
          stopLoading();

          //SnackBar("Logout Status", jsonData['message']);
        } else if (response.statusCode == 401) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          stopLoading();
          //SnackBar("Logout Status", jsonData['message']);
          // print(jsonData['message']);
        }
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
