import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/assets_path.dart';

class OngoingContainer extends StatefulWidget {
  final String? txt;
  final double? price;
  final String? desc;
  final String? image;
  final String? time;
  const OngoingContainer({
    Key? key,
    this.txt,
    this.price,
    this.desc,
    this.image,
    this.time
  }) : super(key: key);

  @override
  State<OngoingContainer> createState() => _OngoingContainerState();
}

class _OngoingContainerState extends State<OngoingContainer> {
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
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text(
                    widget.desc!,
                    style: const TextStyle(
                      fontSize: 12,
                      decorationThickness: 0.6,
                      color: AppColors.DARK_BROWN_COLOR,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  widget.time!,
                  //AppStrings.DATE_TIME_TEXT,
                  style: TextStyle(
                    fontSize: 12,
                    decorationThickness: 0.6,
                    color: AppColors.DARK_BROWN_COLOR,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.price!.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.DARK_BROWN_COLOR,
                    ),
                    textAlign: TextAlign.left,
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
