import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_profile_controller.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/logout_controller.dart';
import 'package:joanie_jasons_day/Edit_Profile/Controller/edit_profile_controller.dart';
import 'package:joanie_jasons_day/Past_Orders/Controllers/get_past_orders_controller.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

import '../widgets/divider_widget.dart';
import '../widgets/drawer_list.dart';

final box = GetStorage();

class DrawerWidget extends GetView<LogoutController> {
  UpdateProfileController updateProfileController =
      Get.put(UpdateProfileController());
  GetProfileController getProfileController = Get.put(GetProfileController());
  GetPastOrdersController getPastOrdersController =
      Get.put(GetPastOrdersController());
  // late final GoogleSignIn _googleSignIn;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.82,
      backgroundColor: AppColors.secondaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(75),
          topRight: Radius.circular(75),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 35.0, left: 30),
        child: GetBuilder<GetProfileController>(
            init: GetProfileController(),
            builder: (getProfileController) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      child: Image.asset(
                        AssetPaths.CLOSE_IMAGE,
                        scale: 3.5,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: const BoxDecoration(
                            color: AppColors.DARK_BROWN_COLOR,
                            shape: BoxShape.circle,
                          ),
                          //child: updateProfileController.isprofilepicpathset == true
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
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Text(
                          box.read("full_name") ?? "",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            decorationThickness: 0.6,
                            color: AppColors.WHITE_COLOR,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.01,
                  // ),
                  const DividerWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  DrawerList(
                    laeding: AssetPaths.PAST_ORDER_IMAGE,
                    title: AppStrings.PAST_ORDERS_TEXT,
                    onTap: () {
                      getPastOrdersController.getAllProducts();
                      Get.toNamed(Routes.PASTORDERS);
                    },
                  ),
                  const DividerWidget(),
                  DrawerList(
                    laeding: AssetPaths.CARD_DETAILS_IMAGE,
                    title: AppStrings.CARD_DETAILS_TEXT,
                    onTap: () {
                      Get.toNamed(Routes.CARDDETAILS);
                    },
                  ),
                  const DividerWidget(),
                  const DrawerList(
                    laeding: AssetPaths.ORDER_STATUS_IMAGE,
                    title: AppStrings.ORDER_STATUS_TEXT,
                    // onTap: () {
                    //   Get.toNamed(Routes.ORDERSTATUS);
                    // },
                  ),
                  const DividerWidget(),
                  DrawerList(
                    laeding: AssetPaths.CONTACT_IMAGE,
                    title: AppStrings.CONTACT_US_TEXT,
                    onTap: () {
                      Get.toNamed(Routes.CONTACTUS);
                    },
                  ),
                  const DividerWidget(),
                  DrawerList(
                    laeding: AssetPaths.SETTINGS_IMAGE,
                    title: AppStrings.SETTINGS_TEXT,
                    onTap: () {
                      Get.toNamed(Routes.SETTINGS);
                    },
                  ),
                  const DividerWidget(),
                  DrawerList(
                    laeding: AssetPaths.LOGOUT_IMAGE,
                    title: AppStrings.LOGOUT_TEXT,
                    onTap: () {
                      // print(box.read("google_token"));
                      // box.remove("google_token");
                      // print("====================================");
                      // print(box.read("google_token"));
                      // try {
                      //   print("++++++++++++++++++++++++++++++++");
                      //   print(box.read("google_token"));
                      //   if (box.read("google_token") == null) {
                      //     print("--------------------------------");
                      //     print(box.read("google_token"));
                      //     Get.toNamed(Routes.PRELOGIN);
                      //   }
                      // } catch (e) {
                      //   print("////////////////////////////////");
                      //   print(box.read("google_token"));
                      //   print(e);
                      // }
                      // _googleSignIn.signOut();
                      controller.logOut();
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
