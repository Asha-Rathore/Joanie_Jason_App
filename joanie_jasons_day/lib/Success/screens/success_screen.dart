import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_logo.dart';
import '../../Widgets/app_template.dart';
import '../widget/success_image_widget.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  TextEditingController codeController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const AppLogo(),
              const SuccessImageWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              AppButton(
                txt: AppStrings.CONTINUE_TEXT,
                color: AppColors.secondaryColor,
                txtcolor: Colors.white,
                iconcolor: Colors.black,
                prefixicon: false,
                onclick: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
