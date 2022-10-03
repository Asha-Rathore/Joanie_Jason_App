import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import '../Utils/constants.dart';

class BottomContainer extends StatefulWidget {
  final String firsttxt;
  final String sectxt;
  final Function()? onclick;
  const BottomContainer({
    Key? key,
    this.onclick,
    required this.firsttxt,
    required this.sectxt,
  }) : super(key: key);

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onclick,
      child: RichText(
        text: TextSpan(
          text: widget.firsttxt,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: Constants.APP_FONT_FAMILY,
            color: AppColors.BLACK_COLOR,
          ),
          children: [
            TextSpan(
              text: widget.sectxt,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
