import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/screens/shopping_cart_screen.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/screens/home_screen.dart';
import 'package:joanie_jasons_day/Drawer_Screens/screens/drawer_widget.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

import '../../Utils/assets_path.dart';
import '../screens/favorites_screen.dart';
import '../screens/profile.dart';
import 'navigation_appbar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key,}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  static const List titles = [
    "Home",
    "Favorites",
    "Shopping Cart",
    "Profile"
  ];

  final pages = [
    HomeScreen(),
    FavoritesScreen(),
    ShoppingCart(isBottom: true,),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: AppColors.APP_COLOR,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              NavigationAppBar(
                txt: titles[pageIndex],
              ),
              pages[pageIndex],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          color: AppColors.DARK_BROWN_COLOR,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              child: pageIndex == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetPaths.HOME_IMAGE,
                          width: 20,
                          //color: AppColors.WHITE_COLOR,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.APP_DARK_COLOR,
                            radius: 3.4,
                          ),
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.HOME_GREY_IMAGE,
                      width: 20,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              child: pageIndex == 1
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetPaths.HEART_IMAGE,
                          width: 20,
                          //color: AppColors.WHITE_COLOR,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.APP_DARK_COLOR,
                            radius: 3.4,
                          ),
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.HEART_GREY_IMAGE,
                      width: 20,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              child: pageIndex == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetPaths.BAG_IMAGE,
                          width: 20,
                          //color: AppColors.WHITE_COLOR,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.APP_DARK_COLOR,
                            radius: 3.4,
                          ),
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.BAG_GREY_IMAGE,
                      width: 20,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              child: pageIndex == 3
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetPaths.PERSON_IMAGE,
                          width: 20,
                          //color: AppColors.WHITE_COLOR,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.APP_DARK_COLOR,
                            radius: 3.4,
                          ),
                        ),
                      ],
                    )
                  : Image.asset(
                      AssetPaths.PERSON_GREY_IMAGE,
                      width: 20,
                      //color: AppColors.WHITE_COLOR,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
