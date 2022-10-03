import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class DividerWidget extends StatefulWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  State<DividerWidget> createState() => _DividerWidgetState();
}

class _DividerWidgetState extends State<DividerWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 30.0),
        height: 1.2,
        color: AppColors.APP_DARK_COLOR,
      ),
    );
  }
}
