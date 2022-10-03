// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/widgets/products_widget.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../../Product_details/Controller/add_to_cart_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/app_buttons.dart';
import '../widgets/preparation_time_tab.dart';
import '../widgets/shopping_cart_container.dart';
import '../widgets/store_location_tab.dart';

class ShoppingCart extends StatefulWidget {
  final bool? isBottom;
  const ShoppingCart({Key? key, this.isBottom = false}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

var args;

class _ShoppingCartState extends State<ShoppingCart> {
  bool isChecked = false;
  AddToCartController addToCartController = Get.find();

  bool isButtonDisabled = false;

  @override
  void initState() {
    if(addToCartController.addtoCartList.length == 0){
      setState(() {
        isButtonDisabled = true;
      });  
    }
    print("jashdjasdaksljdaklsd${addToCartController.addtoCartList.length}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = widget.isBottom;
    return args == false
        ? AppTemplateInside(
            txt: AppStrings.SHOPPING_CART_TEXT, screenChild: cart())
        : cart();
  }

  Widget cart() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            PreparationTimeTab(),
            StoreLoationTab(),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          // child:  addToCartController.addtoCartList.isEmpty
          //       ? Padding(
          //         padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
          //         child: Container(child: Text("No Product in Cart")),
          //       )
          //       : 
                child: FittedBox(
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
                        child: Obx(
                          ()=> Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                child: ListView.builder(
                                    itemCount:
                                        addToCartController.addtoCartList.length,
                                    itemBuilder: (context, index) {
                                      return ProductsWidget(
                                        index: addToCartController
                                            .addtoCartList[index].quantity.toString(),
                                        txt: addToCartController
                                            .addtoCartList[index].productName,
                                        price: "\$" +addToCartController
                                            .addtoCartList[index].productPrice
                                            .toString(),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
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
                                    style: TextStyle(
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
                                      borderRadius: BorderRadius.circular(5),
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
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.85,
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
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
        ),
        Container(
          child: isButtonDisabled == false
          ? AppButton(
            txt: AppStrings.REVIEW_PAYMENT_ADDRESS_TEXT,
            color: AppColors.secondaryColor,
            txtcolor: Colors.white,
            prefixicon: false,
            onclick: () {
              Get.toNamed(Routes.CHECKOUT);
            },
          )
          : SizedBox()
        ),
      ],
    );
  }
}
