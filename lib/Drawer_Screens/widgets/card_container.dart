import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';

class CardConatiner extends StatefulWidget {
  final String? img;
  final double? imgwidth;
  final String? cardNo;
  const CardConatiner({
    Key? key,
    this.img,
    this.imgwidth,
    this.cardNo,
  }) : super(key: key);

  @override
  State<CardConatiner> createState() => _CardConatinerState();
}

class _CardConatinerState extends State<CardConatiner> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
        // left: MediaQuery.of(context).size.height * 0.01,
        // right: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Container(
        height: 50,
        //width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.WHITE_COLOR,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              widget.img!,
              width: widget.imgwidth!,
            ),
            Text(
              widget.cardNo!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
