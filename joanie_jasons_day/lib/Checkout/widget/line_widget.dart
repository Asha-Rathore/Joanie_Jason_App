import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class LineWidget extends StatefulWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  State<LineWidget> createState() => _LineWidgetState();
}

class _LineWidgetState extends State<LineWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "|",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryColor,
        fontSize: 10,
      ),
    );
  }
}
