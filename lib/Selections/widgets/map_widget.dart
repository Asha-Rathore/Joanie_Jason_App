import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/assets_path.dart';

class MapWidget extends StatefulWidget {
  final int? miles;
  const MapWidget({Key? key, this.miles}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.secondaryColor.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(4, 12), // changes position of shadow
              ),
            ],
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(75),
            // border: Border.all(
            //   color: AppColors.secondaryColor,
            //   width: 5,
            // ),

            //),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(AssetPaths.LOCATION_IMAGE),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Container(
            width: 110,
            child: Text(
              widget.miles!.toString() + " Miles Away From You",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                // decoration: TextDecoration.underline,
                decorationThickness: 0.6,
                color: AppColors.DARK_BROWN_COLOR,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
