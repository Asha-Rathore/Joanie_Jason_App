import 'package:flutter/material.dart'; 

class AppButton extends StatefulWidget {
  final String? txt;
  final Color? color;
  final Color? txtcolor;
  final bool? prefixicon;
  final Color? iconcolor;
  final String? img;
  final Function()? onclick;
  const AppButton({
    Key? key,
    this.onclick,
    this.prefixicon = true,
    this.iconcolor,
    this.img,
    this.txt,
    this.color,
    this.txtcolor,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(widget.color!),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ),
        child: Text(
          widget.txt!,
          style: TextStyle(
            color: widget.txtcolor,
            fontSize: 18,
          ),
        ),
        onPressed: widget.onclick,
      ),
    );
  }
}
