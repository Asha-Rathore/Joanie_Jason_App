import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:joanie_jasons_day/Auth_Module/Controller/login_controller.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static final box = GetStorage();
  static final client = http.Client();

  static Future<http.Response?> post(
      String endpoint, var body, bool istoken) async {
    showLoading();

    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      var token = box.read("token");
      if (istoken = true) {
        var response = await client.post(
          headers: {
            'Authorization': 'Bearer $token',
          },
          _buildUrl(endpoint),
          body: body,
        );
        return response;
      } else {
        var response = await client.post(
          _buildUrl(endpoint),
          body: body,
        );
        stopLoading();
        return response;
      }
    } else {
      stopLoading();
      CustomSnackBar("", "No internet connection");
    }
  }

  // static Future<http.Response?> get(String endpoint, bool istoken) async {
  //   showLoading();

  //   ConnectivityManager _connectivityManager = ConnectivityManager();
  //   if (await _connectivityManager.isInternetConnected() == true) {
  //     var token = box.read("token");
  //     if (istoken = true) {
  //       var response = await client.get(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //         },
  //         _buildUrl(endpoint),
  //         //body: body,
  //       );
  //       return response;
  //     } else {
  //       var response = await client.get(
  //         _buildUrl(endpoint),
  //         //body: body,
  //       );
  //       return response;
  //     }
  //   } else {
  //     stopLoading();
  //     CustomSnackBar("", "No internet connection");
  //   }
  // }

  //-------------------------Get Api Function----------------------------
  static Future<http.Response?> get(String endpoint, bool header) async {
    showLoading();

    //-----------------InterNet Connectivity Check------------------------
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      //----------------------With Bearer Token---------------------------
      if (header == true) {
        final box = GetStorage();
        var token = box.read("token");
        var response = await client.get(_buildUrl(endpoint),
            headers: {"Authorization": 'Bearer $token'});

        stopLoading();
        return response;
      } else {
        //-------------------WithOut Bearer Token-------------------------
        var response = await client.get(_buildUrl(endpoint));

        stopLoading();
        return response;
      }
    } else {
      stopLoading();
      CustomSnackBar("", "NO_INTERNET_CONNECTION");
      return null;
    }
  }

  static Future<http.Response?> put(
      String endpoint, var body, bool istoken) async {
    showLoading();

    ConnectivityManager _connectivityManager = ConnectivityManager();

    if (await _connectivityManager.isInternetConnected() == true) {
      var token = box.read("token");
      if (istoken = true) {
        var response = await client.put(
          headers: {
            'Authorization': 'Bearer $token',
          },
          _buildUrl(endpoint),
          body: body,
        );
        return response;
      } else {
        var response = await client.put(
          _buildUrl(endpoint),
          body: body,
        );
        return response;
      }
    } else {
      stopLoading();
      CustomSnackBar("", "No internet connection");
    }
  }

  static Uri _buildUrl(String endpoint) {
    final apiPath = NetworkStrings.apiBaseUrl + endpoint;
    return Uri.parse(apiPath);
  }
}

///////////////////////////////////////
///
///

// class ApiService {
//   static final client = http.Client();

//   static Uri _buildUrl(String endpoint) {
//     final apiPath = NetworkStrings.apiBaseUrl + endpoint;
//     return Uri.parse(apiPath);
//   }

// //===================
//   static Future<http.Response?> post(
//       String endpoint, var body, bool header) async {
//     showLoading();
//     // await Future.delayed(const Duration(seconds: 5), () {
//     //   print('One second has passed.'); // Prints after 1 second.
//     // });
//     ConnectivityManager _connectivityManager = ConnectivityManager();
//     if (await _connectivityManager.isInternetConnected() == true) {
//       // *******************Your Logggic******************
//       // SnackBar_Message("", "INTERNET_CONNECTED");

//       if (header == true) {
//         final box = GetStorage();
//         var token = box.read("token");
//         var response = await client.post(_buildUrl(endpoint),
//             body: body, headers: {"Authorization": 'Bearer $token'});
//         stopLoading();

//         return response;
//       } else {
//         var response = await client.post(
//           _buildUrl(endpoint),
//           body: body,
//         );
//         stopLoading();

//         return response;
//       }
//     } else {
//       stopLoading();
//       SnackBar_Message("", "NO_INTERNET_CONNECTION");
//       //  stopLoading();
//       //AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
//       return null;
//     }
//   }

// //===================
//   static Future<http.Response?> get(String endpoint) async {
//     showLoading();
//     ConnectivityManager _connectivityManager = ConnectivityManager();
//     if (await _connectivityManager.isInternetConnected() == true) {
//       final box = GetStorage();
//       var token = box.read("token");
//       var response = await client.get(_buildUrl(endpoint),
//           headers: {"Authorization": 'Bearer $token'});
//       stopLoading();
//       return response;
//     } else {
//       stopLoading();
//       SnackBar_Message("", "NO_INTERNET_CONNECTION");
//       //AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
//       return null;
//     }
//   }
// }
