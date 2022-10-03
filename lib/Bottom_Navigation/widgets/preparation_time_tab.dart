import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

import '../../Utils/assets_path.dart';

class PreparationTimeTab extends StatefulWidget {
  const PreparationTimeTab(
      {Key? key,})
      : super(key: key);

  @override
  State<PreparationTimeTab> createState() => _PreparationTimeTabState();
}

class _PreparationTimeTabState extends State<PreparationTimeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.47,
      decoration: BoxDecoration(
        color: AppColors.APP_DARK_COLOR,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.APP_DARK_COLOR,
                borderRadius: BorderRadius.circular(35),
                image: const DecorationImage(
                  scale: 3,
                  image: AssetImage(
                    AssetPaths.PREPARATION_TIME_IMAGE,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  AppStrings.PREPARATION_TIME_TEXT,
                  style: TextStyle(
                    fontSize: 12,
                    decorationThickness: 0.6,
                    color: AppColors.BLACK_COLOR,
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  AppStrings.PREPARATION_TIME_IN_MINUTES_TEXT,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 0.6,
                    color: AppColors.BLACK_COLOR,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
