import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class ProductsWidget extends StatefulWidget {
  final String? index;
  final String? txt;
  final String? price;
  const ProductsWidget({Key? key, this.txt, this.price, this.index})
      : super(key: key);

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.secondaryColor,
            ),
            child: Center(
              child: Text(
                widget.index??"",
                style: const TextStyle(
                  color: AppColors.WHITE_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            widget.txt??"",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decorationThickness: 0.6,
              color: AppColors.BLACK_COLOR,
            ),
          ),
          const Spacer(),
          Text(
            widget.price??"",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decorationThickness: 0.6,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
