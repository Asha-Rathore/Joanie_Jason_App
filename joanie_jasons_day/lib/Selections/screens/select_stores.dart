import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Bindings/get_all_category_binding.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_category.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_favorite_controller.dart';
import 'package:joanie_jasons_day/Product_details/Controller/add_to_cart_controller.dart';
import 'package:joanie_jasons_day/Product_details/Controller/product_details_controller.dart';
import 'package:joanie_jasons_day/Selections/Controller/get_restaurant_controller.dart';
import 'package:joanie_jasons_day/Selections/widgets/map_widget.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Widgets/app_logo.dart';
import 'package:joanie_jasons_day/Widgets/app_template.dart';
import 'package:joanie_jasons_day/Widgets/loading_widget.dart';

import '../../Utils/app_colors.dart';
import '../widgets/logo.dart';

// class SelectStoreScreen extends StatefulWidget {
//   const SelectStoreScreen({Key? key}) : super(key: key);

//   @override
//   State<SelectStoreScreen> createState() => _SelectStoreScreenState();
// }

class SelectStoreScreen extends GetView<GetRestaurantController> {
  AddToCartController addToCartController = Get.put(AddToCartController());
  // ProductDetailsController productDetailsController =
  //     Get.put(ProductDetailsController());
  // GetAllFavoriteController getAllFavoriteController =
  //     Get.put(GetAllFavoriteController());
  // GetAllCategoryController getAllCatController =
  //     Get.put(GetAllCategoryController());

  final box = GetStorage();

  // @override
  // void initState() {
  //   getRestaurantController.getRestaurant();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: AppLogo(),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.CHOOSE_STORE_TEXT,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // decoration: TextDecoration.underline,
                    decorationThickness: 0.6,
                    color: AppColors.DARK_BROWN_COLOR,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.getRestaurantList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              LogoWidget(
                                onPressed: () {
                                  box.write("restaurant_id",
                                      controller.getRestaurantList[index].id);
                                  var restaurant_id =
                                      controller.getRestaurantList[index].id;
                                  Get.toNamed(Routes.BOTTOMNAVBAR);
                                  // getAllCatController.getAllCategory();
                                  // getAllCatController.getAllCategory(box.read("restaurant_id"));
                                  // print("==========RESTAURANT ID===========");
                                  // print(box.read("restaurant_id"));
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              MapWidget(
                                miles: controller.cal(
                                    double.parse((controller.getRestaurantList[index].location!.latitude)!),
                                    double.parse((controller.getRestaurantList[index].location!.longitude)!)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              controller.getRestaurantList[index].restName!,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                // decoration: TextDecoration.underline,
                                decorationThickness: 0.6,
                                color: AppColors.secondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: const [
              //     LogoWidget(),
              //     SizedBox(
              //       width: 20,
              //     ),
              //     MapWidget(
              //       txt: AppStrings.MILES_10_AWAY_TEXT,
              //     ),
              //   ],
              // ),
              // const Padding(
              //   padding: EdgeInsets.all(12.0),
              //   child: Text(
              //     AppStrings.STORE_2_ADDRESS_TEXT,
              //     style: TextStyle(
              //       fontSize: 17,
              //       fontWeight: FontWeight.bold,
              //       // decoration: TextDecoration.underline,
              //       decorationThickness: 0.6,
              //       color: AppColors.secondaryColor,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
