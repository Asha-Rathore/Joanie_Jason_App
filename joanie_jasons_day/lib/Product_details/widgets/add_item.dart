import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

class AddItem extends StatefulWidget {
  final Function()? addFunc;
  final Function()? minusFunc;
  final int? quantity;
  const AddItem({
    this.addFunc,
    this.minusFunc,
    this.quantity,
    Key? key,
  }) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  // int quantity = 1;
  // void add() {
  //   setState(() {
  //     quantity++;
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
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Image.asset(
              AssetPaths.MINUS_IMAGE,
              scale: 3,
            ),
            onTap: 
              widget.minusFunc,
              //minus();
          ),
          Text(
            widget.quantity.toString(),
            //quantity.toString(),
            style: TextStyle(
              color: AppColors.WHITE_COLOR,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          InkWell(
            child: Image.asset(
              AssetPaths.PLUS_IMAGE,
              scale: 3,
            ),
            onTap:
              widget.addFunc,
              //add();
          ),
        ],
      ),
    );
  }
}
