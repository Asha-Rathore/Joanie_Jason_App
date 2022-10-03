import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joanie_jasons_day/Utils/Routes/app_pages.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

import '../../Utils/app_colors.dart';

final box = GetStorage();

class ProfileStack extends StatefulWidget {
  final Function()? onclick;
  final Widget? child;
  const ProfileStack({Key? key, this.onclick, this.child,}) : super(key: key);
  @override
  State<ProfileStack> createState() => _ProfileStackState();
}

class _ProfileStackState extends State<ProfileStack> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            width: 150.0,
            height: 150.0,
            decoration: const BoxDecoration(
              color: AppColors.DARK_BROWN_COLOR,
              shape: BoxShape.circle,
            ),
            child: widget.child,
            // child: box.read("profile_pic") == null
            //     ? Image.asset(
            //         AssetPaths.PERSON_IMAGE,
            //         scale: 2,
            //       )
            //     : Container(
            //         height: 140,
            //         width: 140,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           image: DecorationImage(
            //             image: NetworkImage(
            //               box.read("profile_pic"),
            //             ),
            //             fit: BoxFit.fill
            //           ),
            //         ),
            //       ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: InkWell(
                onTap: widget.onclick,
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      scale: 3,
                      image: AssetImage(
                        AssetPaths.UPLOAD_IMAGE,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
