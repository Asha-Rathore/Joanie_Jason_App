import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Utils/app_colors.dart';

class AppTextField extends StatefulWidget {
  final bool? isDisable;
  final bool? enabled;
  final Icon? sufixicon;
  final TextInputType? isNumber;
  final TextInputFormatter? inputFormat;
  final bool? isIcon;
  final String? prefxicon;
  final String? value;
  final String? hinttxt;
  final String? Function(String?)? onSaved;
  final TextEditingController? txtController;
  final bool? obscuretxt;
  final void Function()? onclick;
  final Icon? prefxIcon;
  final String? Function(String?)? validator;
  const AppTextField(
      {Key? key,
      this.isDisable = false,
      this.isNumber,
      this.sufixicon,
      this.enabled = true,
      this.inputFormat,
      this.hinttxt,
      this.value,
      this.txtController,
      this.obscuretxt = false,
      this.validator,
      this.isIcon = true,
      this.onSaved,
      this.onclick,
      this.prefxIcon,
      this.prefxicon})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      //initialValue: widget.value,
      // inputFormatters: [
      //   //widget.inputFormat!,
      //   //FilteringTextInputFormatter.deny(' '),
      //   // BlacklistingTextInputFormatter(new RegExp(r"\s\b|\b\s"),
      //   // WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú 0-9]")))
      // ],
      enabled: widget.enabled,
      //showCursor: widget.isDisable,
      readOnly: widget.isDisable!,
      obscureText: widget.obscuretxt!,
      controller: widget.txtController,
      keyboardType: widget.isNumber,
      style: const TextStyle(
        color: AppColors.DARK_BROWN_COLOR,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        fillColor: AppColors.WHITE_COLOR,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(12, 5, 0, 5),
        // contentPadding: widget.prefxicon == null
        // ? EdgeInsets.only(left: 12)
        // : null,
        prefixIcon: widget.prefxicon != null
            ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: widget.prefxIcon,
              // child: Image.asset(
              //     widget.prefxicon!,
              //     //width: 20,
              //     scale: 2.5,
              //   ),
            )
            : null,
        suffixIcon: widget.sufixicon != null
            ? GestureDetector(
                onTap: widget.onclick,
                child: Padding(
                    padding: EdgeInsets.only(right: 15, top: 6, bottom: 6), child: widget.sufixicon
                    // child: Image.asset(
                    //   widget.sufixicon!,
                    //   width: 2.0,
                    // )
                    ),
              )
              : null,
            //: SizedBox(height: MediaQuery.of(context).size.height * 0.10),
        //prefixIcon: widget.prefxicon,
        //contentPadding: EdgeInsets.only(left: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.WHITE_COLOR),
        ),
        hintText: widget.hinttxt,
        hintStyle: const TextStyle(
          color: AppColors.GREY_COLOR,
          fontSize: 16,
        ),
      ),
      onSaved: widget.onSaved!,
      validator: widget.validator,
    );
  }
}
