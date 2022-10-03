import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Product_details/Controller/add_to_cart_controller.dart';
import 'package:joanie_jasons_day/Product_details/Controller/product_details_controller.dart';
import 'package:joanie_jasons_day/Product_details/Model/add_to_cart_model.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';
import 'package:joanie_jasons_day/Widgets/get_snackbar.dart';

import '../../Widgets/app_buttons.dart';
import '../widgets/add_item.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int? index;
  const ProductDetailsScreen({Key? key, this.index}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductDetailsController productDetailsController = Get.put(ProductDetailsController());
  AddToCartController addToCartController = Get.find<AddToCartController>();

  // int quantity = 1;
  //  var price;
  // var actualPrice;

  @override
  void initState() {
    // productDetailsController.getProductDetails(box.read("product_id"));
    //  price = productDetailsController.price;
    // actualPrice = productDetailsController.price;
    // TODO: implement initState
    super.initState();
  }

  // void add() {
  //   setState(() {
  //     quantity++;
  //     productDetailsController.price = productDetailsController.actualPrice * quantity;
  //     print("pppppppppppppp");
  //     print(productDetailsController.actualPrice * quantity);
  //   });
  // }

  // void minus() {
  //   setState(() {
  //     if (quantity == 1) {
  //       Fluttertoast.showToast(
  //         msg: "Removed From Cart",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 10,
  //         backgroundColor: AppColors.BLACK_COLOR,
  //         textColor: AppColors.WHITE_COLOR,
  //       );
  //       Get.back();
  //     } else {
  //       quantity--;
  //       productDetailsController.price = productDetailsController.price - productDetailsController.actualPrice;
  //       print("ppppppppppppphhhhhhhhhp");
  //       print(productDetailsController.productDetails.productPrice!);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      screenChild: Expanded(
        child: Container(
          //height: MediaQuery.of(context).size.height * 0.70,
          child: 
          GetBuilder<ProductDetailsController>(
              // init: ProductDetailsController(),
              builder: (controller) {
                return 
                controller.productDetails.productName ==
                        null
                    ? Container(
                        color: AppColors.APP_DARK_COLOR,
                      )
                    : Column(
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.APP_DARK_COLOR,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.05),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.14,
                                    width: MediaQuery.of(context).size.height *
                                        0.14,
                                    decoration: BoxDecoration(
                                      //color: AppColors.secondaryColor,
                                      borderRadius: BorderRadius.circular(27),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "http://server.appsstaging.com:3013/" +
                                              controller
                                                  .productDetails.productImage!,
                                        ) as ImageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    //child: Image.asset(AssetPaths.BURGER_IMAGE),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            controller
                                .productDetails.productName!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              decorationThickness: 0.6,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: Text(
                              controller
                                  .productDetails.productDescription!,
                              style: const TextStyle(
                                fontSize: 13,
                                decorationThickness: 0.6,
                                color: AppColors.DARK_BROWN_COLOR,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "\$" + controller.price.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              decorationThickness: 0.6,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          AddItem(
                            addFunc: () {
                              controller.add();
                            },
                            minusFunc: () {
                              controller.minus();
                            },
                            quantity: controller.quantity,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Text(
                            AppStrings.QUANTITY_TEXT,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              // decoration: TextDecoration.underline,
                              decorationThickness: 0.6,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                          ),
                          AppButton(
                            txt: "Add to Cart",
                            color: AppColors.secondaryColor,
                            txtcolor: Colors.white,
                            prefixicon: false,
                            onclick: () {
                              if (addToCartController.addtoCartList.isEmpty) {
                                addToCartController.addProduct(Message(
                                  productId: controller
                                      .productDetails.id,
                                  productName: controller
                                      .productDetails.productName,
                                  productPrice: controller.price.toDouble(),
                                  quantity: controller.quantity,
                                ));
                                Get.toNamed(Routes.SHOPPINGCART);
                              } else if (addToCartController.addtoCartList.isNotEmpty) {
                                int i = 0;
                                for (i; i < addToCartController.addtoCartList.length; i++) {
                                  if (controller.productDetails.id != addToCartController.addtoCartList[i].productId) {
                                    addToCartController.addProduct(Message(
                                      productId: controller
                                          .productDetails.id,
                                      productName: controller
                                          .productDetails.productName,
                                      productPrice: controller.price.toDouble(),
                                      quantity: controller.quantity,
                                    ));
                                    //Get.toNamed(Routes.SHOPPINGCART);
                                  }
                                  else if (controller.productDetails.id == addToCartController.addtoCartList[i].productId){
                                    //addToCartController.addtoCartList[i].quantity! = addToCartController.addtoCartList[i].quantity! + 1;
                                    Get.toNamed(Routes.SHOPPINGCART);
                                  }
                                  // else{
                                  //   CustomSnackBar("","Already exist in cart");
                                  // }
                                  //i++;
                                }
                                Get.toNamed(Routes.SHOPPINGCART);
                              }
                              else{
                                CustomSnackBar("","Something went wrong");
                              }

                              // addToCartController.totalPrice();
                            },
                          ),
                        ],
                      );
              }
              ),
        ),
      ),
      txt: AppStrings.PRODUCT_DETAILS_TEXT,
    );
  }
}
