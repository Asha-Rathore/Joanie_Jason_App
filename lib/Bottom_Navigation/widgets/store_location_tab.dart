import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';

import '../../Utils/assets_path.dart';

class StoreLoationTab extends StatefulWidget {
  const StoreLoationTab({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreLoationTab> createState() => _StoreLoationTabState();
}

class _StoreLoationTabState extends State<StoreLoationTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.44,
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            AppStrings.PREPARATION_TIME_TEXT,
            style: TextStyle(
              fontSize: 14,
              decorationThickness: 0.6,
              color: AppColors.WHITE_COLOR,
            ),
            textAlign: TextAlign.left,
          ),
          Image.asset(
            AssetPaths.DROP_DOWN_IMAGE,
            scale: 3,
          ),
        ],
      ),
    );
  }
}
