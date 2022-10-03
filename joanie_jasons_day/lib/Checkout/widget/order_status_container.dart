import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class ContainerWidget extends StatefulWidget {
  final String? head;
  final String? time;
  final String? img;
  final Color? color;
  const ContainerWidget({
    Key? key,
    this.color,
    this.img,
    this.head,
    this.time,
  }) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: widget.color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.img!,
              width: 40,
            ),
            Text(
              widget.head!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
            Text(
              widget.time!,
              style: const TextStyle(
                fontSize: 14,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
