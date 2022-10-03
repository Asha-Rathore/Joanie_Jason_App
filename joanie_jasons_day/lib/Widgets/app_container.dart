import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Menu/Controllers/add_remove_fav_controller.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

import '../Utils/Routes/app_pages.dart';
import '../Utils/app_colors.dart';
import '../Utils/assets_path.dart';

class AppContainer extends StatefulWidget {
  final String? txt;
  final double? price;
  final String? image;
  final String? productDesc;
  final Function()? onTap;
  final Color? favColor;
  final String? productId;
  const AppContainer(
      {Key? key,
      this.txt,
      this.price,
      this.image,
      this.productDesc,
      this.onTap,
      this.favColor,
      this.productId})
      : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final AddOrRemoveFavoriteController addOrRemoveFavoriteController =
      Get.put(AddOrRemoveFavoriteController());

  initState() {
    super.initState();
  }

  // Defining a variable for storing click state
  // bool isPressed = false;

  // // Click function for changing the state on click
  // _pressed() {
  //   var newVal = true;
  //   if (isPressed) {
  //     newVal = false;
  //   } else {
  //     newVal = true;
  //   }

  //   // This function is required for changing the state.
  //   // Whenever this function is called it refresh the page with new value
  //   setState(() {
  //     isPressed = newVal;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
        right: MediaQuery.of(context).size.width * 0.04,
        left: MediaQuery.of(context).size.width * 0.04,
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
            color: AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.height * 0.14,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(27),
                    image: DecorationImage(
                      image: NetworkImage(
                        "http://server.appsstaging.com:3013/" + widget.image!,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  //child: Image.asset(AssetPaths.BURGER_IMAGE),
                ),
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Text(
                          widget.txt!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decorationThickness: 0.6,
                            color: AppColors.DARK_BROWN_COLOR,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Text(
                            widget.productDesc!,
                            style: const TextStyle(
                              fontSize: 14,
                              decorationThickness: 0.6,
                              color: AppColors.DARK_BROWN_COLOR,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Text(
                        "\$" + widget.price!.toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 0.6,
                          color: AppColors.secondaryColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Obx(
                    ()=> FavoriteButton(
                      iconSize: 30,
                      isFavorite: addOrRemoveFavoriteController.isPressed.value,
                      // valueChanged: widget.onPressed!,
                      // iconDisabledColor: Colors.white,
                      valueChanged: (_isFavorite) {
                        //widget.onPressed!;
                        // addOrRemoveFavoriteController.productId =
                        //           getAllProductsController
                        //               .productList[index].id!;
                        addOrRemoveFavoriteController.productId =
                            widget.productId!;
                        addOrRemoveFavoriteController.addOrRemoveFav();
                        print("pressed");
                        print('Is Favorite : $_isFavorite');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
