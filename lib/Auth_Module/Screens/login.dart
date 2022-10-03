import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Auth_Module/Controller/login_controller.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';
import 'package:joanie_jasons_day/Utils/textfield_validation.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_logo.dart';
import '../../Widgets/app_template.dart';
import '../../Widgets/app_text_field.dart';
import '../../Widgets/bottom_container.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

class LoginScreen extends GetView<LoginController> {
//final loginController = Get.find<LoginController>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.RED_COLOR,
              ),
            )
          : SingleChildScrollView(
              child: Obx(
                () => Form(
                  key: controller.loginFormKey,
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
                          prefxIcon: Icon(
                            Icons.email,
                            color: AppColors.DARK_BROWN_COLOR,
                          ),
                          //inputFormat: FilteringTextInputFormatter.deny(' '),
                          prefxicon: AssetPaths.EMAIL_IMAGE,
                          txtController: controller.emailController,
                          hinttxt: AppStrings.EMAIL_ADDRESS_TEXT,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          validator: (value) {
                            value = value?.trim();
                            return FieldValidator.validateEmail(value!);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AppTextField(
                          prefxIcon: Icon(
                            Icons.lock,
                            color: AppColors.DARK_BROWN_COLOR,
                          ),
                          //inputFormat: null,
                          prefxicon: AssetPaths.LOCK_IMAGE,
                          txtController: controller.passwordController,
                          hinttxt: AppStrings.PASSWORD_TEXT,
                          sufixicon: FieldValidator.isHidepassword.value
                              ? Icon(Icons.visibility_off)
                              : Icon(
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
                        AppButton(
                          txt: AppStrings.LOGIN_TEXT,
                          color: AppColors.secondaryColor,
                          txtcolor: Colors.white,
                          prefixicon: false,
                          onclick: () {
                            controller.checkLogin();
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.FORGOTPASSWORD);
                          },
                          child: const Text(
                            AppStrings.FORGOT_PASSWORD_TEXT,
                            style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        BottomContainer(
                          firsttxt: AppStrings.DONT_HAVE_AN_ACC_TEXT,
                          sectxt: AppStrings.SIGNUP_TEXT,
                          onclick: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Get.toNamed(Routes.SIGNUP);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
      //const Spacer(),
    );
  }
}
