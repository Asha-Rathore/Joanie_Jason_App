import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Password/Controllers/change_older_pass_controller.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/textfield_validation.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';
import 'package:joanie_jasons_day/Widgets/app_text_field.dart';

import '../../Utils/app_colors.dart';
import '../../Widgets/app_buttons.dart';

class ChangeOlderPassword extends GetView<ChangeOlderPasswordController> {
  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      txt: AppStrings.CHANGE_PASSWORD_TEXT,
      screenChild: Expanded(
        child: SingleChildScrollView(
          child: Form(
            child: Obx(
              () => Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings.ENTER_OLD_PASSWORD_TEXT,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                          //decorationThickness: 0.6,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                    ),
                    AppTextField(
                      sufixicon: FieldValidator.isHideoldpassword.value
                          ? Icon(Icons.visibility_off)
                          : const Icon(
                              Icons.visibility,
                              color: AppColors.secondaryColor,
                            ),
                      obscuretxt: FieldValidator.isHideoldpassword.value,
                      onclick: () {
                        FieldValidator.oldpassword_hideIcon();
                      },
                      txtController: controller.passwordController,
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        return FieldValidator.validatePassword(value!);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings.ENTER_NEW_PASSWORD_TEXT,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                          //decorationThickness: 0.6,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                    ),
                    AppTextField(
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
                      txtController: controller.newPasswordController,
                      onSaved: (value) {
                        controller.newpassword = value!;
                      },
                      validator: (value) {
                        return FieldValidator.validatePassword(value!);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppStrings.CONFIRM_PASSWORD_TEXT,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          // decoration: TextDecoration.underline,
                          //decorationThickness: 0.6,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                    ),
                    AppTextField(
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
                        controller.newpassword = value!;
                      },
                      validator: (value) {
                        return FieldValidator.validateConfirmPassword(
                            controller.newPasswordController.text, value!);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.39,
                    ),
                    AppButton(
                      txt: AppStrings.CHANGE_PASSWORD_TEXT,
                      color: AppColors.secondaryColor,
                      txtcolor: Colors.white,
                      prefixicon: false,
                      onclick: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.changePassword();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
