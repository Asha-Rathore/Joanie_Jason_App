import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_category.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_sub_category_controller.dart';
import 'package:joanie_jasons_day/Menu/Controllers/get_all_products_controller.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

import '../../Selections/widgets/home_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();
  final GetAllCategoryController controller=
      Get.put(GetAllCategoryController());
  final GetSubCategoryController getSubCategoryController =
      Get.put(GetSubCategoryController());
  // final GetAllProductsController getAllProductsController =
  //     Get.put(GetAllProductsController());


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      child: Obx(
        () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
            ),
            itemCount: controller.allCategoryList.length,
            itemBuilder: (context, index) {
              return HomeContainer(
                image: controller
                    .allCategoryList[index].categoryImage,
                txt: controller
                    .allCategoryList[index].categoryName,
                onPressed: () {
                  // var category_id = getAllCategoryController.allCategoryList[index].id;
                  // var category_name = getAllCategoryController.allCategoryList[index].categoryName;
                  // dynamic args_response = Get.arguments;
                  // args_response = getAllCategoryController.allCategoryList[index].id;
                    
                    box.write("category_id", controller.allCategoryList[index].id);
                    box.write("category_name", controller.allCategoryList[index].categoryName);
                    getSubCategoryController.getAllSubCategory(box.read("category_id"));
                    print("rrrrrrrrrrrr");
                    box.read("category_id");
                    Get.toNamed(Routes.COFFEE);
                    //getAllProductsController.getAllProducts("62ff7882c9f250bc89e37ffc");
                    print("COFFEE ID");
                    print(box.read("category_id"));

                    print("CAT ID");
                    print(box.read("category_name"));
                    //getSubCategoryController.getAllSubCategory();
                    // box.write("coffee_id",
                    //     getAllCategoryController.allCategoryList[index].id);
                    // print(box.read("coffee_id"));
                },
              );
            }),
      ),
    );
  }
}
