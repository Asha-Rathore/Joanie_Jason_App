import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/otp_controller.dart';
import 'package:joanie_jasons_day/Utils/textfield_validation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_logo.dart';
import '../../Widgets/app_template.dart';
import '../../Widgets/bottom_container.dart';
import '../../Widgets/screen_appbar.dart';

class OtpVerification extends GetView<OtpController> {

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: SingleChildScrollView(
        child: Form(
          key: controller.otpFormKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const AppLogo(),
              const ScreenAppBar(
                txt: AppStrings.ENTER_OTP_VERIFICATION_TEXT,
                leadingicon: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                appContext: context,
                length: 6,
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(10),
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 45,
                  fieldWidth: 45,
                  activeFillColor: AppColors.WHITE_COLOR,
                  inactiveFillColor: AppColors.WHITE_COLOR,
                  selectedFillColor: AppColors.WHITE_COLOR,
                  activeColor: AppColors.WHITE_COLOR,
                  inactiveColor: AppColors.WHITE_COLOR,
                  selectedColor: AppColors.WHITE_COLOR,
                ),
                showCursor: false,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                boxShadows: [
                  BoxShadow(
                      //blurStyle:  BlurStyle.normal,
                      color: AppColors.GREY_COLOR.withOpacity(0.6),
                      blurRadius: 5,
                      //spreadRadius: 5,
                      offset: Offset(0, 4)),
                ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                onChanged: (value) {
                  debugPrint(value);
                },
                onSaved: (value) {
                  controller.code = value!;
                },
                validator: (value) {
                  return FieldValidator.validateOTP(value!);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              AppButton(
                txt: AppStrings.CONTINUE_TEXT,
                color: AppColors.secondaryColor,
                txtcolor: Colors.white,
                iconcolor: Colors.black,
                prefixicon: false,
                onclick: () {
                  controller.checkOtp();
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              GetBuilder<OtpController>(
                builder: (builder) => Text(
                  '00 :${controller.count} ',
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: AppColors.BLACK_COLOR,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              GetBuilder<OtpController>(
                builder: (builder) => BottomContainer(
                  firsttxt: AppStrings.DIDNOT_RECEIVE_CODE_TEXT,
                  sectxt: AppStrings.RESEND_TEXT,
                  onclick: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (controller.count == 0) {
                      controller.reset();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
