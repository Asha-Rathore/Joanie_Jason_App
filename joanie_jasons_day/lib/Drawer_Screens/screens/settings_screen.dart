import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../../Utils/app_colors.dart';
import '../../Widgets/app_buttons.dart';
import '../widgets/push_notification_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      screenChild: Column(
        children: [
          const PushNotificationButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          AppButton(
            txt: AppStrings.CHANGE_PASSWORD_TEXT,
            color: AppColors.secondaryColor,
            txtcolor: Colors.white,
            prefixicon: false,
            onclick: () {
              Get.toNamed(Routes.CHANGEOLDERPASSWORD);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          AppButton(
            txt: AppStrings.TERMS_AND_CONDITIONS_TEXT,
            color: AppColors.secondaryColor,
            txtcolor: Colors.white,
            prefixicon: false,
            onclick: () {
              Get.toNamed(Routes.TERMSANDCONDITION);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          AppButton(
            txt: AppStrings.PRIVACY_POLICY_TEXT,
            color: AppColors.secondaryColor,
            txtcolor: Colors.white,
            prefixicon: false,
            onclick: () {
              Get.toNamed(Routes.PRIVACYPOLICY);
            },
          ),
        ],
      ),
      txt: AppStrings.SETTINGS_TEXT,
    );
  }
}
