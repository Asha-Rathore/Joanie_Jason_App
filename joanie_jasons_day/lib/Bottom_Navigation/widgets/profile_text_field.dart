import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/assets_path.dart';

class ProfileTextField extends StatefulWidget {
  final String? hinttxt;
  final TextEditingController? txtController;
  final bool? obscuretxt;
  final String? Function(String?)? validator;
  const ProfileTextField({
    Key? key,
    this.hinttxt,
    this.txtController,
    this.obscuretxt = false,
    this.validator,
  }) : super(key: key);

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        enabled: false,
        showCursor: true,
        autofocus: false,
        keyboardType: TextInputType.none,
        readOnly: true,
        obscureText: widget.obscuretxt!,
        controller: widget.txtController,
        style: const TextStyle(
          color: AppColors.DARK_BROWN_COLOR,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: AppColors.WHITE_COLOR,
          filled: true,
          contentPadding: EdgeInsets.only(left: 12),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              scale: 4,
              // height: 20,
              // width: 20,
              AssetPaths.EDIT_ICON,
            ),
          ),
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
        validator: widget.validator,
      ),
    );
  }
}
