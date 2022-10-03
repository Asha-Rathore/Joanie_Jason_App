import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/add_card_controller.dart';
import 'package:joanie_jasons_day/Drawer_Screens/Controllers/get_card_controller.dart';
import 'package:joanie_jasons_day/Drawer_Screens/widgets/card_container.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';
import 'package:joanie_jasons_day/Utils/textfield_validation.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../../Utils/app_colors.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_text_field.dart';

// class CardDetailScreen extends StatefulWidget {
//   const CardDetailScreen({Key? key}) : super(key: key);

//   @override
//   State<CardDetailScreen> createState() => _CardDetailScreenState();
// }

class CardDetailScreen extends GetView<AddCardController> {
  //AddCardController addCardController = Get.put(AddCardController());
  //GetCardDetailController getCardDetailController = Get.put(GetCardDetailController());

  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      screenChild: Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: controller.cardDetailFormKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.02,
                right: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.CARD_NUMBER_TEXT,
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
                    isNumber: TextInputType.number,
                    txtController: controller.cardNumberController,
                    onSaved: (value) {
                      controller.cardNumber = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppStrings.EXP_MONTH_TEXT,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              //decorationThickness: 0.6,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: AppTextField(
                              isNumber: TextInputType.number,
                              txtController: controller.expMonthController,
                              onSaved: (value) {
                                controller.expMonth = value!;
                              },
                              validator: (value) {
                                return FieldValidator.validateName(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            AppStrings.EXP_YEAR_TEXT,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              //decorationThickness: 0.6,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: AppTextField(
                              isNumber: TextInputType.number,
                              txtController: controller.expYearController,
                              onSaved: (value) {
                                controller.expYear = value!;
                              },
                              validator: (value) {
                                return FieldValidator.validateName(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      //AppTextField(),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.CVV_TEXT,
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
                    isNumber: TextInputType.number,
                    txtController: controller.cvvController,
                    onSaved: (value) {
                      controller.cvv = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  AppButton(
                    txt: AppStrings.ADD_CARD_TEXT,
                    color: AppColors.secondaryColor,
                    txtcolor: Colors.white,
                    prefixicon: false,
                    onclick: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      controller.addCard();
                      //getCardDetailController.getCardDetail();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.04,
                        right: MediaQuery.of(context).size.height * 0.04,
                      ),
                      child: Container(
                        //margin: const EdgeInsetsDirectional.only(end: 10.0),
                        height: 1.2,
                        color: AppColors.GREY_COLOR,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GetBuilder<GetCardDetailController>(
                      init: GetCardDetailController(),
                      builder: (controller) {
                        return ListView.builder(
                            itemCount: controller.getCardDetailList.length,
                            itemBuilder: (context, index) {
                              return CardConatiner(
                                img: AssetPaths.STRIPE_IMAGE,
                                imgwidth: 50,
                                cardNo: controller
                                    .getCardDetailList[index].cardNumber
                                    .toString(),
                              );
                            });
                      },
                    ),
                  ),
                  // const CardConatiner(
                  //   img: AssetPaths.STRIPE_IMAGE,
                  //   imgwidth: 50,
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  // const CardConatiner(
                  //   img: AssetPaths.PAYPAL_IMAGE,
                  //   imgwidth: 75,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      txt: AppStrings.CARD_DETAILS_TEXT,
    );
  }
}
