// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_sub_category_controller.dart';
// import 'package:joanie_jasons_day/Menu/Controllers/add_remove_fav_controller.dart';
// import 'package:joanie_jasons_day/Menu/Controllers/get_all_products_controller.dart';
// import 'package:joanie_jasons_day/Product_details/Controller/product_details_controller.dart';
// import 'package:joanie_jasons_day/Product_details/screens/product_details_screen.dart';
// import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
// import 'package:joanie_jasons_day/Utils/app_colors.dart';
// import 'package:joanie_jasons_day/Utils/app_strings.dart';
// import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

// import '../../Widgets/app_container.dart';
// import '../../Widgets/tab_widget.dart';

// final box = GetStorage();

// class CoffeeScreen extends StatefulWidget {
//   const CoffeeScreen({Key? key}) : super(key: key);

//   @override
//   State<CoffeeScreen> createState() => _CoffeeScreenState();
// }

// class _CoffeeScreenState extends State<CoffeeScreen>
//     with TickerProviderStateMixin {
//   late TabController tabController;

//  // final GetSubCategoryController getSubCategoryController =
//    //   Get.put(GetSubCategoryController());

//    final GetSubCategoryController getSubCategoryController =
//       Get.find<GetSubCategoryController>();

// //  final GetAllProductsController getAllProductsController =
//   //    Get.put(GetAllProductsController());

//  final GetAllProductsController getAllProductsController =
//       Get.find<GetAllProductsController>();

//   final AddOrRemoveFavoriteController addOrRemoveFavoriteController =
//       Get.put(AddOrRemoveFavoriteController());

//   final ProductDetailsController productDetailsController =
//       Get.put(ProductDetailsController());

//   bool isPressed = false;

//     // Click function for changing the state on click
//   _pressed() {
//     var newVal = true;
//     if (isPressed) {
//       newVal = false;
//       print("pressed true");
//     } else {
//       newVal = true;
//       print("pressed false");
//     }

//     // This function is required for changing the state.
//     // Whenever this function is called it refresh the page with new value
//     setState(() {
//       isPressed = newVal;
//     });
//   }

//   // @override
//   // void initState() {
//   //   getSubCategoryController.getAllSubCategory();

//   //   //getAllProductsController.getAllProducts("62ff7882c9f250bc89e37ffc");
//   //   tabController = TabController(
//   //     //length: 3,
//   //     length: getSubCategoryController.categoryList.length,
//   //     vsync: this,
//   //     initialIndex: 0,
//   //   );
//   //   print("================LIST LENGTH===============");
//   //   print(getSubCategoryController.categoryList.length);
//   //   print(getAllProductsController.productList.length);
//   //   print(getSubCategoryController.length);
//   //   super.initState();
//   // }

//   @override
//   void initState() {

//     super.initState();
//   }

//   @override
//   void dispose() {
//     getSubCategoryController.tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppTemplateInside(
//       txt: box.read("category_name"),
//       screenChild: Expanded(
//         child: Container(
//           //height: MediaQuery.of(context).size.height * 0.95,
//           child: Obx(
//             () => Column(
//               children: [
//                 TabBar(
//                   isScrollable: true,
//                   indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       35.0,
//                     ),
//                     color: AppColors.APP_COLOR,
//                   ),
//                   padding: EdgeInsets.zero,
//                   //indicatorPadding: EdgeInsets.all(0.5),
//                   labelPadding: const EdgeInsets.only(left: 3, right: 3),
//                   labelColor: AppColors.WHITE_COLOR,
//                   unselectedLabelColor: AppColors.WHITE_COLOR,
//                   tabs: List.generate(
//                     getSubCategoryController.categoryList.length,
//                     (index) => InkWell(
//                       child: Container(),
//                       // child: TabWidget(
//                       //   image: getSubCategoryController
//                       //       .categoryList[index].categoryImage,
//                       //   txt: getSubCategoryController
//                       //       .categoryList[index].categoryName,
//                       //   outterColor: AppColors.secondaryColor,
//                       //   innerColor: AppColors.primaryColor,
//                       //   txtColor: AppColors.WHITE_COLOR,
//                       // ),
//                       onTap: () {
//                         box.write("Sub_category_id",
//                             getSubCategoryController.categoryList[index].id);
//                         getAllProductsController
//                             .getAllProducts(box.read("Sub_category_id"));
//                       },
//                     ),
//                     //box.write("Sub_category_id", getSubCategoryController.categoryList[index].id);
//                   ),
//                   controller: getSubCategoryController.tabController,
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 // Expanded(
//                 //   child: TabBarView(
//                 //     physics: const NeverScrollableScrollPhysics(),
//                 //     // children: [
//                 //     //   Text("Tab View"),
//                 //     //   Text("Tab View"),
//                 //     //   Text("Tab View"),
//                 //     //   Text("Tab View"),
//                 //     // ],
//                 //     // ignore: sort_child_properties_last
//                 //     children: List.generate(
//                 //       getSubCategoryController.categoryList.length,
//                 //       (index) => Container(
//                 //         height: MediaQuery.of(context).size.height * 0.60,
//                 //         child: Column(
//                 //           children: List.generate(
//                 //             //5,
//                 //             getAllProductsController.productList.length,
//                 //             //(index) => Text("Tab View")
//                 //             (index) => AppContainer(
//                 //               image: getAllProductsController
//                 //                   .productList[index].productImage,
//                 //               txt: getAllProductsController
//                 //                   .productList[index].productName,
//                 //               price: getAllProductsController
//                 //                   .productList[index].productPrice,
//                 //               isPressed: addOrRemoveFavoriteController.isPressed,
//                 //               onTap: () {
//                 //                 box.write(
//                 //                     "product_id",
//                 //                     getAllProductsController
//                 //                         .productList[index].id);
//                 //                   print("Product ID for Product deatils ${getAllProductsController.productList[index].id}");
//                 //                 print("Product ID for Product deatils ${box.read("product_id")}");
//                 //                 //productDetailsController.getProductDetails(getAllProductsController.productList[index].id!);
//                 //                 Get.toNamed(Routes.PRODUCTDETAILS);
//                 //                 //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
//                 //               },
//                 //               onPressed: () {
//                 //                 addOrRemoveFavoriteController.productId =
//                 //                     getAllProductsController
//                 //                         .productList[index].id!;
//                 //                 addOrRemoveFavoriteController.addOrRemoveFav();
//                 //                 print("pressed");
//                 //                 addOrRemoveFavoriteController.pressed();
//                 //               },
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //     controller: getSubCategoryController.tabController,
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_sub_category_controller.dart';
import 'package:joanie_jasons_day/Menu/Controllers/add_remove_fav_controller.dart';
import 'package:joanie_jasons_day/Menu/Controllers/get_all_products_controller.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';
import 'package:joanie_jasons_day/Widgets/app_container.dart';
import 'package:joanie_jasons_day/Widgets/app_template.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';
import 'package:joanie_jasons_day/Widgets/tab_widget.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({Key? key}) : super(key: key);

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  final box = GetStorage();
  // GetSubCategoryController getSubCategoryController =
  //     Get.put(GetSubCategoryController());
  GetAllProductsController getAllProductsController =
      Get.put(GetAllProductsController());

  // final AddOrRemoveFavoriteController addOrRemoveFavoriteController =
  //     Get.put(AddOrRemoveFavoriteController());

  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      txt: box.read("category_name"),
      screenChild: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            child: GetBuilder<GetSubCategoryController>(
              // init: GetSubCategoryController(),
              builder: (controller) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    return TabWidget(
                      txt: controller.categoryList[index].categoryName,
                      outterColor: AppColors.secondaryColor,
                      innerColor: AppColors.primaryColor,
                      txtColor: AppColors.WHITE_COLOR,
                      image: controller.categoryList[index].categoryImage,
                      onTap: () {
                        // getAllProductsController.getAllProducts("");
                        box.write("Sub_category_id",
                            controller.categoryList[index].id);
                        getAllProductsController
                            .getAllProducts(box.read("Sub_category_id"));
                      },
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: GetBuilder<GetAllProductsController>(
              init: GetAllProductsController(),
              builder: (controller) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return controller.productList.isEmpty
                        ? Container(
                            child: Text(
                            "No Product found",
                            style: TextStyle(
                              color: AppColors.BLACK_COLOR,
                              fontSize: 18,
                            ),
                          ))
                        : AppContainer(
                            image: controller.productList[index].productImage,
                            txt: controller.productList[index].productName,
                            price: controller.productList[index].productPrice!.toDouble(),
                            productDesc: controller
                                .productList[index].productDescription,
                            productId:
                                getAllProductsController.productList[index].id!,
                            onTap: () {
                              box.write(
                                  "product_id",
                                  getAllProductsController
                                      .productList[index].id);
                              print(
                                  "Product ID for Product deatils ${getAllProductsController.productList[index].id}");
                              print(
                                  "Product ID for Product deatils ${box.read("product_id")}");
                              //productDetailsController.getProductDetails(getAllProductsController.productList[index].id!);
                              Get.toNamed(Routes.PRODUCTDETAILS);
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
                            },
                            // onPressed: () {
                            //   addOrRemoveFavoriteController.productId =
                            //       getAllProductsController
                            //           .productList[index].id!;
                            //   addOrRemoveFavoriteController.addOrRemoveFav();
                            //   print("pressed");

                            //   //addOrRemoveFavoriteController.pressed();
                            // },
                          );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
