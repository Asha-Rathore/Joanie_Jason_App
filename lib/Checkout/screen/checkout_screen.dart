import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/add_order_controller.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/widgets/products_widget.dart';
import 'package:joanie_jasons_day/Checkout/Controller/get_restaurant_detail_controller.dart';
import 'package:joanie_jasons_day/Product_details/Controller/add_to_cart_controller.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../../Bottom_Navigation/widgets/shopping_cart_container.dart';
import '../../Selections/widgets/logo.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/tab_widget.dart';
import '../widget/container.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  AddToCartController addToCartController = Get.put(AddToCartController());
  GetRestaurantDetailsController getRestaurantDetailsController = Get.put(GetRestaurantDetailsController());
  AddOrderController addOrderController = Get.put(AddOrderController());

  final box = GetStorage();

  @override
  void initState() {
    getRestaurantDetailsController.getRestaurantDetails(box.read("restaurant_id"));
    // TODO: implement initState
    super.initState();
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
        screenChild: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      ContainerWidget(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.02,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  AppStrings.PAYMENT_METHOD_TEXT,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    decorationThickness: 0.6,
                                    color: AppColors.BLACK_COLOR,
                                  ),
                                ),
                                Text(
                                  AppStrings.PAYMENT_METHOD_PRICE_TEXT,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decorationThickness: 0.6,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.02,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AssetPaths.STRIPE_IMAGE,
                                  width: 50,
                                ),
                                const Text(
                                  AppStrings.STRIPE_NUMBER_TEXT,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    decorationThickness: 0.6,
                                    color: AppColors.BLACK_COLOR,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                            child: addToCartController.addtoCartList.length == 0
                                ? Container(child: Text("No Product in Cart"))
                                : FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Container(
                                    //height: 150,
                                    width: MediaQuery.of(context).size.width * 0.85,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: AppColors.WHITE_COLOR,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height *
                                                0.02,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context).size.height * 0.2,
                                            child: Obx(
                                              ()=> ListView.builder(
                                                  itemCount:
                                                      addToCartController.addtoCartList.length,
                                                  itemBuilder: (context, index) {
                                                    return ProductsWidget(
                                                      index: (index + 1).toString(),
                                                      txt: addToCartController
                                                          .addtoCartList[index].productName,
                                                      price: "\$" +addToCartController
                                                          .addtoCartList[index].productPrice
                                                          .toString(),
                                                    );
                                                  }),
                                                  
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height *
                                                0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Text(
                                                AppStrings.SUB_TOTAL_TEXT,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  decorationThickness: 0.6,
                                                  color: AppColors.BLACK_COLOR,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "\$" +addToCartController.total.toStringAsFixed(2),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  decorationThickness: 0.6,
                                                  color: AppColors.secondaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Checkbox(
                                                side: const BorderSide(
                                                  color: AppColors.secondaryColor,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                checkColor: Colors.white,
                                                activeColor: AppColors.secondaryColor,
                                                //fillColor: MaterialStateProperty.resolveWith(),
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },
                                              ),
                                              const Text(
                                                AppStrings.APPY_GIFT_CARD_TEXT,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  decorationThickness: 0.6,
                                                  color: AppColors.BLACK_COLOR,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height *
                                                0.02,
                                          ),
                                          Container(
                                            height: 50,
                                            width: MediaQuery.of(context).size.width *
                                                0.85,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color: AppColors.APP_DARK_COLOR),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    AppStrings.TOTAL_TAX_TEXT,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      decorationThickness: 0.6,
                                                      color: AppColors.BLACK_COLOR,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 8.0),
                                                  child: Text(
                                                    "\$" +addToCartController.total.toStringAsFixed(2),
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                      decorationThickness: 0.6,
                                                      color: AppColors.secondaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height *
                                                0.02,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ContainerWidget(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child:  GetBuilder<GetRestaurantDetailsController>(
                                // init: GetRestaurantDetailsController(),
                                builder: (controller) {
                                  return Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          AppStrings.PICKUP_LOCATION_TEXT,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            decorationThickness: 0.6,
                                            color: AppColors.BLACK_COLOR,
                                          ),
                                        ),
                                        Text(
                                          controller.restaurantDetails.restName??"",
                                          style: TextStyle(
                                            fontSize: 14,
                                            decorationThickness: 0.6,
                                            color: AppColors.BLACK_COLOR,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.30,
                                          child: Text(
                                            controller.restaurantDetails.restName??"",
                                            style: TextStyle(
                                              fontSize: 10,
                                              // decoration: TextDecoration.underline,
                                              decorationThickness: 0.6,
                                              color: AppColors.secondaryColor,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    );
                                }
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: LogoWidget(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      AppButton(
                        txt: AppStrings.CHECKOUT_BUTTON_TEXT,
                        color: AppColors.secondaryColor,
                        txtcolor: Colors.white,
                        prefixicon: false,
                        onclick: () {
                          // addOrderController.orderPrice = addToCartController
                          //                               .addtoCartList[0].productPrice
                          //                               .toString();
                          addOrderController.orderPrice = "80";
                          addOrderController.addOrder();
                          Get.toNamed(Routes.BOTTOMNAVBAR);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        txt: AppStrings.CHECKOUT_TEXT);
  }
}
