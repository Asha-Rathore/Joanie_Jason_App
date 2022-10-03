import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';

class CustomFancyImage extends StatelessWidget {
  String image;
  bool? is_proile;
  CustomFancyImage({Key? key, required this.image,this.is_proile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      errorWidget: Image.network(
          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
      imageUrl: image,
      shimmerBaseColor: AppColors.WHITE_COLOR,
      shimmerHighlightColor: AppColors.GREY_COLOR,
      shimmerBackColor: AppColors.WHITE_COLOR,
      boxFit: is_proile==true? BoxFit.fill:BoxFit.contain,
    );
  }
}