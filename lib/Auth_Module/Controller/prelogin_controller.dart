import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joanie_jasons_day/Auth_Module/Models/social_login_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'dart:io' show Platform;

import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

final box = GetStorage();

class PreLoginController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  static googleSignUp(String socialType) async {
    try {
      showLoading();
      ConnectivityManager _connectivityManager = ConnectivityManager();
      if (await _connectivityManager.isInternetConnected() == true) {
        final GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: ['email'],
        );
        final FirebaseAuth _auth = FirebaseAuth.instance;
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        var token = googleUser!.id;
        box.write("google_token", token);

        box.write("full_name", googleUser.displayName);
        print(box.read("full_name"));

        box.write("user_email", googleUser.email);
        print(box.read("user_email"));

        final User? user =
            await (await _auth.signInWithCredential(credential)).user;
        //Log().e(user!.displayName);

        print("***********************************");
        box.write("number", user!.phoneNumber);
        print(box.read("number"));
        print("***********************************");
        // print("***********************************");
        // box.write("profile_pic", googleUser.photoUrl);
        // print(box.read("profile_pic"));
        // print("***********************************");

        print("=================================");
        print(token);
        print(googleUser);

        if (googleUser != null) {
          await _googleSignIn.signOut();
        }
        // print("signed in " + user!.displayName.toString());
        String? FMtoken = await FirebaseMessaging.instance.getToken();

        print(FMtoken);

        var deviceType;
        if (Platform.isAndroid == true) {
          deviceType = "Android";
        } else if (Platform.isIOS == true) {
          deviceType = "iOS";
        }
        print(Platform.isAndroid);
        print(Platform.isIOS);
        print("=============777=================");
        final Map<String, dynamic> data = <String, dynamic>{};
        data['user_social_token'] = googleUser.id.toString();
        data['user_social_type'] = socialType;
        data['user_device_type'] = deviceType;
        data['user_device_token'] = FMtoken;
        data['profilePicture'] = googleUser.photoUrl;
        var response = await ApiService.post(
            NetworkStrings.socialLoginEndpoint, data, false);
        var jsonData = jsonDecode(response!.body);
        print("==============================");
        print(response.statusCode);
        if (response.statusCode == 200) {
          Get.offAllNamed(Routes.SELECTSTORES);
          print(jsonData['message']);
          var obj = SocialLoginModel.fromJson(jsonData);
          box.write("_id", obj.data.id);
          box.write("token", obj.data.userAuthentication);
          print("***********************************");
          box.write("profile_pic", obj.data.profilePicture);
          print(box.read("profile_pic"));
          print(">>>>>>>>>>>>>>>>>>>>>>>>");
          print(obj.data.profilePicture);
          print("***********************************");
          print("-----------------------------------");
          print(obj.data.userAuthentication);
          // SnackBar("Login Status", jsonData['message']);
        } else if (response.statusCode == 401) {
          Get.offAllNamed(Routes.LOGIN);
        } else {
          stopLoading();
          //SnackBar("Login Status", jsonData['message']);
          print(jsonData['message']);
        }
      } else {
        stopLoading();
        CustomSnackBar("", "NO_INTERNET_CONNECTION");
        //  stopLoading();
        //AppDialogs.showToast(message: NetworkStrings.NO_INTERNET_CONNECTION);
        return;
      }

      //return user;
    } catch (e) {
      stopLoading();
      print('google login nai chal rha');
      print(e);
    }
  }

  Future<void> checkLogin() async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['user_social_token'] = "";
      data['user_social_type'] = "";
      data['user_device_type'] = "";
      data['user_device_token'] = "";
      var response =
          await ApiService.post(NetworkStrings.socialLoginEndpoint, data, false)
              .timeout(Duration(seconds: 120));
      var jsonData = jsonDecode(response!.body);
      if (response.statusCode == 200) {
        Get.toNamed(Routes.SELECTSTORES);
        print(jsonData['message']);
        var obj = SocialLoginModel.fromJson(jsonData);
        box.write("token", obj.token);

        print(obj.token);
        // SnackBar("Login Status", jsonData['message']);
      } else {
        stopLoading();
        //SnackBar("Login Status", jsonData['message']);
        print(jsonData['message']);
      }
    } on TimeoutException catch (_) {
      stopLoading();
      CustomSnackBar("", "Server not responding");
    }

    // print(response.statusCode);
    // print(response.body);
  }
}
