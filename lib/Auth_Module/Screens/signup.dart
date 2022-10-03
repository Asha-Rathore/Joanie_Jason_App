import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/signup_controller.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/textfield_validation.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_logo.dart';
import '../../Widgets/app_template.dart';
import '../../Widgets/app_text_field.dart';
import '../../Widgets/bottom_container.dart';

class SignupScreen extends GetView<SignUpController> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: SingleChildScrollView(
        child: Obx(
          () => Form(
            key: controller.signupFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  const AppLogo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  AppTextField(
                    isIcon: false,
                    txtController: controller.fullNameController,
                    hinttxt: AppStrings.FULL_NAME_TEXT,
                    onSaved: (value) {
                      controller.fullName = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AppTextField(
                    isIcon: false,
                    txtController: controller.emailController,
                    hinttxt: AppStrings.EMAIL_TEXT,
                    onSaved: (value) {
                      controller.email = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validateEmail(value!);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AppTextField(
                    isIcon: false,
                    txtController: controller.passwordController,
                    hinttxt: AppStrings.PASSWORD_TEXT,
                    sufixicon: FieldValidator.isHidepassword.value
                        ? Icon(Icons.visibility_off)
                        : const Icon(
                            Icons.visibility,
                            color: AppColors.secondaryColor,
                          ),
                    obscuretxt: FieldValidator.isHidepassword.value,
                    onclick: () {
                      FieldValidator.password_hideIcon();
                    },
                    onSaved: (value) {
                      controller.password = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validatePassword(value!);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AppTextField(
                    isIcon: false,
                    txtController: controller.confirmPasswordController,
                    hinttxt: AppStrings.CONFIRM_PASSWORD_TEXT,
                    sufixicon: FieldValidator.isHideconfirmpassword.value
                        ? Icon(Icons.visibility_off)
                        : const Icon(
                            Icons.visibility,
                            color: AppColors.secondaryColor,
                          ),
                    obscuretxt: FieldValidator.isHideconfirmpassword.value,
                    onclick: () {
                      FieldValidator.confirm_password_hideIcon();
                    },
                    onSaved: (value) {
                      controller.confirmPassword = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validateConfirmPassword(
                        controller.passwordController.text,
                        value!,
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AppTextField(
                    isIcon: false,
                    isNumber: TextInputType.number,
                    txtController: controller.phoneNumberController,
                    hinttxt: AppStrings.PHONE_NUMBER_TEXT,
                    //obscuretxt: true,
                    onSaved: (value) {
                      controller.phoneNumber = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validatePhoneNumber(value!);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  AppButton(
                    txt: AppStrings.SIGNUP_TEXT,
                    color: AppColors.secondaryColor,
                    txtcolor: Colors.white,
                    iconcolor: Colors.black,
                    prefixicon: false,
                    onclick: () {
                      controller.checkSignUp();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  BottomContainer(
                    firsttxt: AppStrings.ALREADY_HAVE_AN_ACC_TEXT,
                    sectxt: AppStrings.LOGIN_TEXT,
                    onclick: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Get.toNamed(Routes.LOGIN);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
