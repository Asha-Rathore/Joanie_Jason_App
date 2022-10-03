import 'package:flutter/material.dart';

import '../Utils/assets_path.dart';

class TabWidget extends StatefulWidget {
  final String? txt;
  final Color? outterColor;
  final Color? innerColor;
  final Color? txtColor;
  final String? image;
  final Function()? onTap;
  const TabWidget(
      {Key? key, this.txt, this.innerColor, this.outterColor, 
      this.image, 
      this.txtColor,
      this.onTap,
      })
      : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width * 0.03
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 72,
          width: MediaQuery.of(context).size.width * 0.44,
          decoration: BoxDecoration(
            color: widget.outterColor,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: widget.innerColor,
                    borderRadius: BorderRadius.circular(35),
                    image: DecorationImage(
                      scale: 3,
                      image: NetworkImage(
                        "http://server.appsstaging.com:3013/" + widget.image!,
                        //AssetPaths.PREPARATION_TIME_IMAGE,
                      ),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.22,
                child: Text(
                  widget.txt!,
                  style: TextStyle(
                    fontSize: 12,
                    decorationThickness: 0.6,
                    color: widget.txtColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
