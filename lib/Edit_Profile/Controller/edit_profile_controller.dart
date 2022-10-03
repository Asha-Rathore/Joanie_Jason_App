import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joanie_jasons_day/Auth_Module/Models/signup_model.dart';
import 'package:joanie_jasons_day/Edit_Profile/Model/edit_profile_model.dart';
import 'package:joanie_jasons_day/Services/api_services.dart';
import 'package:joanie_jasons_day/Services/connectivity_manager.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Utils/Routes/app_pages.dart';

final box = GetStorage();
dynamic user_id_response;
File? image;
var token = box.read("token");

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();

  late TextEditingController fullNameController;

  var selestedImagePath = ''.obs;
  var selestedImageSize = ''.obs;
  var isprofilepicpathset = false.obs;

  var fullName = "";

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController(text: box.read("full_name"));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    fullNameController.dispose();
  }

  // File? _image;
  // PickedFile? pickedImage;
  // final _picker = ImagePicker();
  // // Implementing the image picker
  // Future<void> pickImage() async {
  //  pickedImage=
  //   await _picker.getImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //       _image = File(pickedImage!.path);
  //   }
  // }

  // PickedFile? filePicked;
  // PickedFile? get pickedFile=>pickedFile;

  // Future<void> upload() async {
   
  //   http.StreamedResponse response = await updateProfile(filePicked);
  //   //_isLoading = false;
  //   if (response.statusCode == 200) {
  //     Map map = jsonDecode(await response.stream.bytesToString());
  //     String message = map["message"];
  //     //_imagePath=message;
  //    // _pickedFile = null;
  //     //await getUserInfo();
  //     print(message);
  //   } else {
  //     print("error posting the image");
  //   }
  //   update();

  // }

  // Future<http.StreamedResponse> updateProfile(PickedFile? data) async {
  //   http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('http://server.appsstaging.com:3013/api/updateProfile'));
  //   request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
  //   if(GetPlatform.isMobile && data != null) {
  //     File _file = File(data.path);
  //     request.files.add(http.MultipartFile('profilePicture', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
  //   }
  //   Map<String, String> _fields = Map();
  //   _fields.addAll(<String, String>{
  //     'user_name': fullName
  //   });
  //   request.fields.addAll(_fields);
  //   http.StreamedResponse response = await request.send();
  //   return response;
  // }

 var profilepicpath = "".obs;
  
  ImagePicker imagePicker = ImagePicker();
  File? pickedFile;

  void takephoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    print("imagepath${pickedFile}");
    setprofilepath(pickedFile!.path);
    Get.back();

    // if (pickedFile != null) {
    //   prfileSetupController.uploadImage();
    // }
  }







  

  //============================================================
  void setprofilepath(String path) {
    selestedImagePath.value = path;
    isprofilepicpathset.value = true;
  }

//+++++++++++++++++++++++++++++++
// Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       final tempImage = File(image.path);
//       // setState(() => this.image = tempImage);
//     } on PlatformException catch (_) {
//       customSnackBar('Failed to load Image');
//     }
//   }
  Future<void> uploadImage() async {
    final isValid = editProfileFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    editProfileFormKey.currentState!.save();

    try{
      showLoading();
    ConnectivityManager _connectivityManager = ConnectivityManager();
    if (await _connectivityManager.isInternetConnected() == true) {
      var token = box.read('token');
      Map<String, String> header = {"Authorization": 'Bearer $token'};
      var uri = Uri.parse(NetworkStrings.apiBaseUrl + 'updateProfile');
      var request = http.MultipartRequest('PUT', uri);
      request.headers.addAll(header);
      request.fields['user_name'] = fullName;
      var multipart =
          http.MultipartFile.fromPath('profilePicture', selestedImagePath.value).timeout(Duration(seconds: 120));
      request.files.add(await multipart);
      var streamResponse = await request.send();
      var response = await http.Response.fromStream(streamResponse);
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);
        print(token);
        stopLoading();

        var obj = EditProfileModel.fromJson(jsonData);

        box.remove("profile_pic");
        String pic = "http://server.appsstaging.com:3013/" + obj.user.profilePicture!;
        box.write("profile_pic", obj.user.profilePicture);
        print(box.read("profile_pic"));
        box.write("full_name", obj.user.userName);
        print(box.read("full_name"));
        CustomSnackBar("Edit Profile", jsonData['message']);
        Get.toNamed(Routes.BOTTOMNAVBAR);
        selestedImagePath.value = '';
        // log.i(response.statusCode);
        // log.i(response.body);
      } else if(response.statusCode == 401){
        Get.offAllNamed(Routes.LOGIN);
      }else {
        print(response.statusCode);
        print(response.body);
        stopLoading();
        CustomSnackBar("Edit Profile", jsonData['message']);

        // log.i(response.statusCode);
        // log.i(response.body);
        //SnackBar("title", "Failed To load image in Server");
        // customSnackBar('Failed To load image in Server');
      }
    } else {
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

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selestedImagePath.value = pickedFile.path;
      selestedImageSize.value =
          ((File(selestedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";

      
    } else {
      CustomSnackBar("Error", "No image selected");
    }
  }

  // File? image ;
  // final _picker = ImagePicker();
  // bool showSpinner = false ;

  // Future getImageFromGallery()async{
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery , imageQuality: 80);

  //   if(pickedFile!= null ){
  //     image = File(pickedFile.path);
  //     // setState(() {

  //     // });
  //   }else {
  //     print('no image selected');
  //   }
  // }

  //  Future<void> uploadImage ()async{

  //   // setState(() {
  //   //   showSpinner = true ;
  //   // });

  //   var stream  = new http.ByteStream(image!.openRead());
  //   stream.cast();

  //   var length = await image!.length();

  //   var uri = Uri.parse('http://server.appsstaging.com:3013/api/updateProfile');

  //   var request = new http.MultipartRequest('POST', uri);

  //   request.fields['user_name'] = fullName ;

  //   var multiport = new http.MultipartFile(
  //       'profilePicture',
  //       stream,
  //       length);

  //   request.files.add(multiport);

  //   var response = await request.send() ;

  //   print(response.stream.toString());
  //   if(response.statusCode == 200){
  //     // setState(() {
  //     //   showSpinner = false ;
  //     // });
  //     print('image uploaded');
  //   }else {
  //     print('failed');
  //     // setState(() {
  //     //   showSpinner = false ;
  //     // });

  //   }

  // }

  // Future<void> editProfile() async {
  //   final isValid = editProfileFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   editProfileFormKey.currentState!.save();

  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['user_name'] = fullName;
  //   data['profilePicture'] = selestedImagePath.value.toString();
  //   print("================================");
  //   print(selestedImagePath.value.toString());

  //   var response =
  //       await ApiService.put(NetworkStrings.updateProfileEndpoint, data, true);
  //   var jsonData = jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     print(jsonData['message']);
  //     var obj = SignupModel.fromJson(jsonData);
  //     user_id_response = obj.data.userId;
  //     Get.toNamed(
  //       Routes.BOTTOMNAVBAR,
  //     );
  //     print(obj.data.userId);

  //     SnackBar("Signup Status", jsonData['message']);
  //   } else {
  //     SnackBar("Signup Status", jsonData['message']);
  //     print(jsonData['message']);
  //   }
  //   print(response.statusCode);
  //   print(response.body);
  // }
}
