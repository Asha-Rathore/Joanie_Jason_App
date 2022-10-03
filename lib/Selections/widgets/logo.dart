import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Selections/Controller/get_restaurant_controller.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';

import '../../Utils/Routes/app_pages.dart';
import '../../Utils/assets_path.dart';

class LogoWidget extends StatefulWidget {
  final Function()? onPressed;
  const LogoWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  State<LogoWidget> createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 107,
        width: 107,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.WHITE_COLOR,
          //borderRadius: BorderRadius.circular(75),
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 5,
          ),

          //),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.asset(
            AssetPaths.J_LOGO,
          ),
        ),
      ),
    );
  }
}
