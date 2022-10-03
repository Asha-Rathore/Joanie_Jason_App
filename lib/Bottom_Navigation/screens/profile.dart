// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_profile_controller.dart';
// import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
// import 'package:joanie_jasons_day/Utils/app_strings.dart';
// import 'package:joanie_jasons_day/Utils/assets_path.dart';

// import '../../Utils/app_colors.dart';
// import '../widgets/profile_image_widget.dart';
// import '../widgets/profile_text_field.dart';

// final box = GetStorage();
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final GetProfileController getProfileController=
//       Get.put(GetProfileController());
//   // @override
//   // void initState() {
//   //   getProfileController.getProfile();

//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ProfileStack(
//           child: getProfileController.getProfileList.profilePicture == null
//               ? Image.asset(
//                   AssetPaths.PERSON_IMAGE,
//                   scale: 2,
//                 )
//               : Container(
//                   height: 140,
//                   width: 140,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                       image: NetworkImage(
//                         "http://server.appsstaging.com:3013/" + getProfileController.getProfileList.profilePicture!
//                       ),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//           onclick: () {
//             Get.toNamed(Routes.EDITPROFILE);
//           },
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.08,
//         ),
//         const Align(
//           alignment: Alignment.topLeft,
//           child: Text(
//             AppStrings.NAME_TEXT,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: AppColors.BLACK_COLOR,
//             ),
//           ),
//         ),
//         ProfileTextField(
//           hinttxt: getProfileController.getProfileList.userName,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         const Align(
//           alignment: Alignment.topLeft,
//           child: Text(
//             AppStrings.EMAIL_TEXT,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               // decoration: TextDecoration.underline,
//               //decorationThickness: 0.6,
//               color: AppColors.BLACK_COLOR,
//             ),
//           ),
//         ),
//         ProfileTextField(
//           hinttxt: getProfileController.getProfileList.userEmail,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         const Align(
//           alignment: Alignment.topLeft,
//           child: Text(
//             AppStrings.NUMBER_TEXT,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               // decoration: TextDecoration.underline,
//               //decorationThickness: 0.6,
//               color: AppColors.BLACK_COLOR,
//             ),
//           ),
//         ),
//         ProfileTextField(
//           hinttxt: getProfileController.getProfileList.number.toString(),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         const Align(
//           alignment: Alignment.topLeft,
//           child: Text(
//             AppStrings.PASSWORD_TEXT,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               // decoration: TextDecoration.underline,
//               //decorationThickness: 0.6,
//               color: AppColors.BLACK_COLOR,
//             ),
//           ),
//         ),
//         const ProfileTextField(
//           hinttxt: AppStrings.ASTERISK_TEXT,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

import '../../Utils/app_colors.dart';
import '../widgets/profile_image_widget.dart';
import '../widgets/profile_text_field.dart';

final box = GetStorage();
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileStack(
          child: box.read("profile_pic") == null
              ? Image.asset(
                  AssetPaths.PERSON_IMAGE,
                  scale: 2,
                )
              : Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "http://server.appsstaging.com:3013/" + box.read("profile_pic"),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          onclick: (){
            Get.toNamed(Routes.EDITPROFILE);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppStrings.NAME_TEXT,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.BLACK_COLOR,
            ),
          ),
        ),
        ProfileTextField(
          hinttxt: box.read("full_name"),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppStrings.EMAIL_TEXT,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // decoration: TextDecoration.underline,
              //decorationThickness: 0.6,
              color: AppColors.BLACK_COLOR,
            ),
          ),
        ),
        ProfileTextField(
          hinttxt: box.read("user_email"),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppStrings.NUMBER_TEXT,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // decoration: TextDecoration.underline,
              //decorationThickness: 0.6,
              color: AppColors.BLACK_COLOR,
            ),
          ),
        ),
        ProfileTextField(
          hinttxt: box.read("number").toString(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            AppStrings.PASSWORD_TEXT,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // decoration: TextDecoration.underline,
              //decorationThickness: 0.6,
              color: AppColors.BLACK_COLOR,
            ),
          ),
        ),
        const ProfileTextField(
          hinttxt: AppStrings.ASTERISK_TEXT,
        ),
      ],
    );
  }
}