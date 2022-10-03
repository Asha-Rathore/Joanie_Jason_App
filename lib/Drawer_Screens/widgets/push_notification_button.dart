import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_strings.dart';

class PushNotificationButton extends StatefulWidget {
  const PushNotificationButton({Key? key}) : super(key: key);

  @override
  State<PushNotificationButton> createState() => _PushNotificationButtonState();
}

class _PushNotificationButtonState extends State<PushNotificationButton> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.APP_DARK_COLOR,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Text(
              AppStrings.RECEIVE_PUSH_NOTIFICATION_TEXT,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: CupertinoSwitch(
              activeColor: AppColors.secondaryColor,
              value: value,
              onChanged: (v) => setState(() => value = v),
            ),
          ),
        ],
      ),
    );
  }
}
