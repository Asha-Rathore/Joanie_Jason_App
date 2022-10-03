import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/fancy_shimmer.dart';
import 'package:joanie_jasons_day/Utils/network_strings.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/assets_path.dart';

class FavContainer extends StatefulWidget {
  final String? txt;
  final double? price;
  final String? description;
  final String? image;
  final Function()? onTap;
  const FavContainer(
      {Key? key, this.txt, this.price, this.description, this.image, this.onTap,})
      : super(key: key);

  @override
  State<FavContainer> createState() => _FavContainerState();
}

class _FavContainerState extends State<FavContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
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
                  //color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(27),
                  // image: DecorationImage(
                  //   image: CustomFancyImage(image: NetworkStrings.imageBaseUrl+widget.image!) as ImageProvider,
                  //   fit: BoxFit.fill,
                  // ),
                ),
                child: CustomFancyImage(image: NetworkStrings.imageBaseUrl+widget.image!),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.txt!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 0.6,
                    color: AppColors.DARK_BROWN_COLOR,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Text(
                    widget.description!,
                    style: TextStyle(
                      fontSize: 14,
                      decorationThickness: 0.6,
                      color: AppColors.DARK_BROWN_COLOR,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price!.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.secondaryColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  InkWell(
                    onTap: widget.onTap,
                    child: Image.asset(
                      AssetPaths.LIKE_IMAGE,
                      width: 20,
                      //color: AppColors.WHITE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
