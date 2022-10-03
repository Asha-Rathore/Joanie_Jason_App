import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';

import '../../Utils/assets_path.dart';

class HomeContainer extends StatefulWidget {
  final String? txt;
  final Function()? onPressed;
  final String? image;
  const HomeContainer({Key? key, this.txt, this.onPressed, this.image})
      : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      //color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(
                          "http://server.appsstaging.com:3013/" + widget.image!,
                        ),
                        fit: BoxFit.fill,
                      )),
                  // child: Image.network(
                  //   "http://server.appsstaging.com:3013/" + widget.image!,
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0, bottom: 1),
                child: Text(
                  widget.txt!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // decoration: TextDecoration.underline,
                    decorationThickness: 0.6,
                    color: AppColors.BLACK_COLOR,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
