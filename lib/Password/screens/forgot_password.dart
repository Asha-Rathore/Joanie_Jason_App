import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Password/Controllers/forgot_password_controller.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_logo.dart';
import '../../Widgets/app_template.dart';
import '../../Widgets/app_text_field.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {

  bool isSignup = false;
  bool _isLoading = false;
  String? code;
  String? user_id;

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: SingleChildScrollView(
        child: Form(
          key: controller.forgotPasswordFormKey,
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
                  txtController: controller.emailController,
                  hinttxt: AppStrings.ENTER_EMAIL_ADDRESS_TEXT,
                  onSaved: (value) {
                    controller.email = value!;
                  },
                  validator: (value) {
                    return controller.validateEmail(value!);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                AppButton(
                  txt: AppStrings.GET_CODE_TEXT,
                  color: AppColors.secondaryColor,
                  txtcolor: Colors.white,
                  iconcolor: Colors.black,
                  prefixicon: false,
                  onclick: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.checkValidEmail();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
