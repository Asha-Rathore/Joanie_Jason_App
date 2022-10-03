import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/Controller/get_all_favorite_controller.dart';
import 'package:joanie_jasons_day/Menu/Controllers/add_remove_fav_controller.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

import '../widgets/search_bar.dart';
import '../widgets/fav_container.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  //GetAllFavoriteController getAllFavoriteController = Get.find();
  AddOrRemoveFavoriteController addOrRemoveFavoriteController = Get.put(AddOrRemoveFavoriteController());
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SearchBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            child: GetBuilder<GetAllFavoriteController>(
              init: GetAllFavoriteController(),
              builder: (getAllFavoriteController) {
                return ListView.builder(
                      itemCount: getAllFavoriteController.allFavoriteList.length,
                      itemBuilder: (context, index) {
                        return FavContainer(
                            txt: getAllFavoriteController
                                .allFavoriteList[index].productId!.productName,
                            price: getAllFavoriteController
                                .allFavoriteList[index].productId!.productPrice!.toDouble(),
                            image: getAllFavoriteController
                                .allFavoriteList[index].productId!.productImage,
                            description: getAllFavoriteController
                                .allFavoriteList[index]
                                .productId!
                                .productDescription,
                            onTap: () {
                              addOrRemoveFavoriteController.productId = getAllFavoriteController.allFavoriteList[index].productId!.id!;
                              addOrRemoveFavoriteController.addOrRemoveFav();
                              setState(() {
                                getAllFavoriteController.allFavoriteList.remove(index);
                              });
                              
                            }
                          );
                      },
                    );
              }
            ),
          )
          // const FavContainer(
          //   txt: AppStrings.THE_PATTY_MELT_TEXT,
          //   price: AppStrings.DOLLAR_14_TEXT,
          // ),
          // const FavContainer(
          //   txt: AppStrings.COLD_BREW_TEXT,
          //   price: AppStrings.DOLLAR_2_TEXT,
          // ),
          // const FavContainer(
          //   txt: AppStrings.COFFEE_TEXT,
          //   price: AppStrings.DOLLAR_8_TEXT,
          // ),
          // const FavContainer(
          //   txt: AppStrings.BREAKFAST_TEXT,
          //   price: AppStrings.DOLLAR_14_TEXT,
          // ),
        ],
      ),
    );
  }
}
