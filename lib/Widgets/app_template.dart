import 'package:flutter/material.dart';

import '../Utils/assets_path.dart';

class AppTemplate extends StatefulWidget {
  final Widget child;
  const AppTemplate({Key? key, required this.child}) : super(key: key);

  @override
  State<AppTemplate> createState() => _AppTemplateState();
}

class _AppTemplateState extends State<AppTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPaths.BACKGROUND_IMAGE),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(left: 13.0, right: 13.0),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
