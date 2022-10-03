import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class DrawerList extends StatefulWidget {
  final String? title;
  final String? laeding;
  final Function()? onTap;
  const DrawerList({
    Key? key,
    this.title,
    this.laeding,
    this.onTap
  }) : super(key: key);

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0),
                child: Image.asset(
                  widget.laeding!,
                  scale: 3.5,
                ),
              ),
              Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decorationThickness: 0.6,
                  color: AppColors.WHITE_COLOR,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
