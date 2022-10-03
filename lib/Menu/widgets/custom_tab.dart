// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:joanie_jasons_day/Utils/app_colors.dart';
// import 'package:joanie_jasons_day/Widgets/tab_widget.dart';

// import '../../Bottom_Navigation/Controller/get_sub_category_controller.dart';

// class CustomTabBar extends StatefulWidget {
//   const CustomTabBar({Key? key}) : super(key: key);

//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar>
//     with TickerProviderStateMixin {
//   late TabController tabController;

//   GetSubCategoryController getSubCategoryController =
//       Get.put(GetSubCategoryController());

//   @override
//   void initState() {
//     tabController = TabController(
//       length: getSubCategoryController.categoryList.length,
//       vsync: this,
//     );
//     getSubCategoryController.getAllSubCategory(box.read("coffee_id"));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: ListView.builder(
//               itemCount: getSubCategoryController.categoryList.length,
//               itemBuilder: (context, index) {
//                 return TabWidget(
//                   image:
//                       getSubCategoryController.categoryList[index].categoryImage,
//                   txt: getSubCategoryController.categoryList[index].categoryName,
//                   outterColor: AppColors.secondaryColor,
//                   innerColor: AppColors.primaryColor,
//                   txtColor: AppColors.WHITE_COLOR,
//                 );
//               }),
//         );
//   }
// }
