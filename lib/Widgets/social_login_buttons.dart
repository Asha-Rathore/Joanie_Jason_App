import 'package:flutter/material.dart';

class SocialLoginButton extends StatefulWidget {
  final String? txt;
  final Color? color;
  final Color? txtcolor;
  final bool? prefixicon;
  final Color? iconcolor;
  final String? img;
  final Function()? onclick;
  const SocialLoginButton({
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
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 55,
                width: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    widget.img!,
                    fit: BoxFit.contain,
                    color: widget.iconcolor,
                    scale: 2,
                  ),
                ),
              ),
            ),
            Text(
              widget.txt!,
              style: TextStyle(
                color: widget.txtcolor,
                fontSize: 18,
              ),
            ),
          ],
        ),
        onPressed: widget.onclick,
      ),
    );
  }
}
