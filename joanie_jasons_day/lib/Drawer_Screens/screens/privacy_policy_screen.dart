import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/termscondition_privacypolicy_controller.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() =>
      _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final TermsPrivacyPolicyController termsPrivacyController =
      Get.put(TermsPrivacyPolicyController());
  @override
  void initState() {
    termsPrivacyController.GetPrivacy();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
        // isLeading: AssetPaths.BACK_WHITE_ICON,
        // onclickLead: () {
        //   Get.back();
        // },
        txt: AppStrings.PRIVACY_POLICY_TEXT,
        screenChild: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Obx(
                () => Text(
                  termsPrivacyController.cotent.value,
                  style: TextStyle(
                    fontSize: 14,
                    // decoration: TextDecoration.underline,
                    decorationThickness: 0.6,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget terms(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        // decoration: TextDecoration.underline,
        decorationThickness: 0.6,
        color: AppColors.secondaryColor,
      ),
    );
  }
}

