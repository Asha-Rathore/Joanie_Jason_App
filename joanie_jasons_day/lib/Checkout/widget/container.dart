import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class ContainerWidget extends StatefulWidget {
  final Widget? child;
  const ContainerWidget({Key? key, this.child}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.WHITE_COLOR,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: widget.child,
      ),
    );
  }
}
