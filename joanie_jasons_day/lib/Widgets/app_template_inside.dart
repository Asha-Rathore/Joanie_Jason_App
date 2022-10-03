import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Widgets/screen_appbar.dart';

class AppTemplateInside extends StatefulWidget {
  final String? txt;
  final Widget? screenChild;
  const AppTemplateInside({
    Key? key,
    required this.screenChild,
    required this.txt,
  }) : super(key: key);

  @override
  State<AppTemplateInside> createState() => _AppTemplateInsideState();
}

class _AppTemplateInsideState extends State<AppTemplateInside> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.APP_COLOR,
      body: Column(
        children: [
          ScreenAppBar(
            txt: widget.txt!,
          ),
          widget.screenChild!,
        ],
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}
