import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Selections/Model/get_restaurant_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class GetRestaurantController extends GetxController {

  RxList<Message> getRestaurantList = <Message>[].obs;
  // RxList<Location> getRestaurantLoc = <Location>[].obs;
   //RxList<Timing> getRestaurantTiming = <Timing>[].obs;

  late Position position;
  double distanceInMeters = 0.0;
  int distancekm = 0;
  double miles = 0;

  @override
  void onInit() async {
    position = await _getGeoLocationPosition();
    getRestaurant();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  int cal(double la, double lo) {
    // position = await _getGeoLocationPosition();
    showLoading();
    print(position);
    print(la);
    print(lo);
    print("0000000000000000000000000");
    distanceInMeters = Geolocator.distanceBetween(
        position.latitude, position.longitude, la, lo);
    // distanceInMeters = (distanceInMeters / 1000).toInt().toDouble();
    print(distanceInMeters);
    distancekm = (distanceInMeters / 1000).toInt();
    print(distancekm);
    print("return distanceInMeters;");
    miles = (distanceInMeters / 1000) * 0.621371;
    stopLoading();
    return (miles.toInt());
  }

  Future<void> getRestaurant() async {

    try{
      showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();

    if (await _connectivityManager.isInternetConnected() == true) {
      var response = await ApiService.get(NetworkStrings.getAllRestaurantEndPoint, true).timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        print(jsonData['message']);
        var obj = GetRestaurantModel.fromJson(jsonData);
        // print(obj);
        getRestaurantList.value = obj.message!;
        //getRestaurantLoc.value = obj.message![0].location! as List<Location>;
        // getRestaurantTiming.value = obj.message![0].timing!;
        // print("ooooooooooooooooo");
        // print(getRestaurantTiming.length);
        // print("llllllllllllllllllll");
        // print(getRestaurantLoc.length);
        print("===============RESTAURANT LIST=============");
        print(box.read("_id"));
          print(box.read("token"));
        //print(getRestaurantList.value);
        //allCategoryList.value = obj.message;
        stopLoading();

        //SnackBar("Logout Status", jsonData['message']);
      } 
      else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      }
      else {
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
      return;
    }
    }on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }
    
    
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
