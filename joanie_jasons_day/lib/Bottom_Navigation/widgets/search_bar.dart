import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

import '../../Utils/app_colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.WHITE_COLOR,
      ),
      child: Form(
        //key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            style: const TextStyle(
              color: AppColors.DARK_BROWN_COLOR,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  height: 20,
                  width: 20,
                  AssetPaths.SEARCH_IMAGE,
                ),
              ),
              border: InputBorder.none,
              hintText: AppStrings.SEARCH_TEXT,
              hintStyle: const TextStyle(
                color: AppColors.DARK_BROWN_COLOR,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
