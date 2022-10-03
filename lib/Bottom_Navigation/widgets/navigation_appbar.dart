import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/assets_path.dart';

class NavigationAppBar extends StatefulWidget {
  final String txt;
  const NavigationAppBar({
    Key? key,
    required this.txt,
  }) : super(key: key);

  @override
  State<NavigationAppBar> createState() => _NavigationAppBarState();
}

class _NavigationAppBarState extends State<NavigationAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset(
              AssetPaths.MENU_IMAGE,
              //color: AppColors.WHITE_COLOR,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text(
        widget.txt,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          // decoration: TextDecoration.underline,
          decorationThickness: 0.6,
          color: AppColors.BLACK_COLOR,
        ),
      ),
      centerTitle: true,
    );
  }
}
