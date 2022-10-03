import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/prelogin_controller.dart';
import 'package:joanie_jasons_day/Auth_Module/widgets/alertbox.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Widgets/bottom_container.dart';
import 'package:joanie_jasons_day/Widgets/social_login_buttons.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/assets_path.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_logo.dart';
import '../../Widgets/app_template.dart';


class PreLogin extends GetView<PreLoginController> {
  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const AppLogo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SocialLoginButton(
              txt: AppStrings.LOGIN_WITH_EMAIL_TEXT,
              color: AppColors.secondaryColor,
              txtcolor: AppColors.WHITE_COLOR,
              img: AssetPaths.EMAIL_ICON,
              iconcolor: AppColors.WHITE_COLOR,
              onclick: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertBoxWidget(),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SocialLoginButton(
              txt: AppStrings.LOGIN_WITH_FACEBOOK_TEXT,
              color: Colors.blue,
              txtcolor: AppColors.WHITE_COLOR,
              img: AssetPaths.FACEBOOK_ICON,
              iconcolor: AppColors.WHITE_COLOR,
              onclick: (){
                controller.checkLogin();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SocialLoginButton(
              txt: AppStrings.LOGIN_WITH_GOOGLE_TEXT,
              color: AppColors.RED_COLOR,
              txtcolor: AppColors.WHITE_COLOR,
              img: AssetPaths.GOOGLE_ICON,
              iconcolor: AppColors.WHITE_COLOR,
              onclick: (){
                PreLoginController.googleSignUp("google");
                //controller.checkLogin();
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Platform.isIOS ?
            SocialLoginButton(
              txt: AppStrings.LOGIN_WITH_APPLE_TEXT,
              color: AppColors.WHITE_COLOR,
              txtcolor: AppColors.BLACK_COLOR,
              img: AssetPaths.APPLE_LOGO_ICON,
              iconcolor: AppColors.BLACK_COLOR,
              onclick: (){
                //controller.signInWithApple(context: context, socialType: "apple");
              },
            ) : SizedBox(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            BottomContainer(
              firsttxt: AppStrings.DONT_HAVE_AN_ACC_TEXT,
              sectxt: AppStrings.SIGNUP_TEXT,
              onclick: () {
                Get.toNamed(Routes.SIGNUP);
              },
            )
          ],
        ),
      ),
    );
  }
}
