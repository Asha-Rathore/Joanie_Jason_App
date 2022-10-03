import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

class SuccessImageWidget extends StatefulWidget {
  const SuccessImageWidget({Key? key}) : super(key: key);

  @override
  State<SuccessImageWidget> createState() => _SuccessImageWidgetState();
}

class _SuccessImageWidgetState extends State<SuccessImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPaths.TICK_IMAGE,
      scale: 4,
    );
  }
}