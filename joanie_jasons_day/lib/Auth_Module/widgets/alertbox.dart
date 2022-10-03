import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

import '../../Utils/Routes/app_pages.dart';

class AlertBoxWidget extends StatefulWidget {
  const AlertBoxWidget({Key? key}) : super(key: key);

  @override
  State<AlertBoxWidget> createState() => _AlertBoxWidgetState();
}

class _AlertBoxWidgetState extends State<AlertBoxWidget> {
  bool termsnConditionsisChecked = false;
  bool privacyPoliciesisChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      title: const Text(
        AppStrings.AGREEMENT_TEXT,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        AppStrings.DISCLAIMER_TEXT,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.BLACK_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        const Text(
          AppStrings.LOREM_TEXT,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.secondaryColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              side: const BorderSide(
                color: AppColors.secondaryColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              checkColor: Colors.white,
              activeColor: AppColors.secondaryColor,
              //fillColor: MaterialStateProperty.resolveWith(),
              value: termsnConditionsisChecked,
              onChanged: (bool? value) {
                setState(() {
                  termsnConditionsisChecked = value!;
                });
              },
            ),
            const Text(
              AppStrings.TERMS_AND_CONDITIONS_TEXT,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              side: const BorderSide(color: AppColors.secondaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              checkColor: Colors.white,
              activeColor: AppColors.secondaryColor,
              //fillColor: MaterialStateProperty.resolveWith(),
              value: privacyPoliciesisChecked,
              onChanged: (bool? value) {
                setState(() {
                  privacyPoliciesisChecked = value!;
                });
              },
            ),
            const Text(
              AppStrings.PRIVACY_POLICIES_TEXT,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.35,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
                child: const Text(
                  "Reject",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.35,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    AppColors.secondaryColor,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                child: const Text(
                  "Accept",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (termsnConditionsisChecked == true &&
                      privacyPoliciesisChecked == true) {
                    // AppNavigation.navigateTo(
                    //     context, AppRouteName.LOGIN_SCREEN_ROUTE);
                    Get.offNamed(Routes.LOGIN);
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
