import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Menu/widgets/custom_tab.dart';

import '../Utils/app_colors.dart';
import '../Utils/assets_path.dart';

class ScreenAppBar extends StatefulWidget {
  final String txt;
  final bool? leadingicon;
  const ScreenAppBar({
    Key? key,
    required this.txt,
    this.leadingicon = true,
  }) : super(key: key);

  @override
  State<ScreenAppBar> createState() => _ScreenAppBarState();
}

class _ScreenAppBarState extends State<ScreenAppBar> {

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
          visible: widget.leadingicon!,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                        AssetPaths.BACK_ICON,
                        //color: AppColors.WHITE_COLOR,
                      ) !=
                      null
                  ? Image.asset(
                      AssetPaths.BACK_ICON,
                      //color: AppColors.WHITE_COLOR,
                    )
                  : const SizedBox(),
            ),
          )),
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
      // bottom: TabBar(
      //   tabs: [
      //     CustomTabBar()
      //   ],
      //   controller: tabController,
      // )
    );
  }
}
