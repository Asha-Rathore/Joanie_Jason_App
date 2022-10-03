import 'package:flutter/material.dart';

import '../Utils/assets_path.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Image.asset(
          AssetPaths.JOANIE_LOGO,
        ),
      ),
    );
  }
}
