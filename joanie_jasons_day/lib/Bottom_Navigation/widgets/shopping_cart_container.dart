import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Bottom_Navigation/widgets/products_widget.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

class ShoppingCartContainer extends StatefulWidget {
  final int? index;
  final String? productName;
  final double? productPrice;
  final double? totalPrice;
  const ShoppingCartContainer({
    Key? key,
    this.index,
    this.productName,
    this.productPrice,
    this.totalPrice
  }) : super(key: key);

  @override
  State<ShoppingCartContainer> createState() => _ShoppingCartContainerState();
}

class _ShoppingCartContainerState extends State<ShoppingCartContainer> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        //height: 150,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.WHITE_COLOR,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ProductsWidget(
                index: widget.index.toString(),
                txt: widget.productName,
                price: widget.productPrice.toString(),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // const ProductsWidget(
              //   index: "2",
              //   txt: AppStrings.THE_PATTY_MELT_TEXT,
              //   price: AppStrings.SHOPPING_CART_PRICES_TEXT,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    AppStrings.SUB_TOTAL_TEXT,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                  Spacer(),
                  Text(
                    AppStrings.SUB_TOTAL_PRICE_TEXT,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    side: const BorderSide(
                      color: AppColors.secondaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    checkColor: Colors.white,
                    activeColor: AppColors.secondaryColor,
                    //fillColor: MaterialStateProperty.resolveWith(),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text(
                    AppStrings.APPY_GIFT_CARD_TEXT,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.APP_DARK_COLOR),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        AppStrings.TOTAL_TAX_TEXT,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 0.6,
                          color: AppColors.BLACK_COLOR,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        widget.totalPrice.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decorationThickness: 0.6,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
