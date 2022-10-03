import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joanie_jasons_day/Edit_Profile/Controller/edit_profile_controller.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';
import 'package:joanie_jasons_day/Utils/textfield_validation.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../../Bottom_Navigation/widgets/profile_image_widget.dart';
import '../../Utils/Routes/app_pages.dart';
import '../../Utils/app_colors.dart';
import '../../Widgets/app_buttons.dart';
import '../../Widgets/app_text_field.dart';

final box = GetStorage();

class EditProfile extends GetView<UpdateProfileController> {
  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      screenChild: Expanded(
        child: SingleChildScrollView(
          child: Form(
            key: controller.editProfileFormKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Column(
                children: [
                  Obx(
                    () => Container(
                      width: 150,
                      height: 150,
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: const BoxDecoration(
                              color: AppColors.DARK_BROWN_COLOR,
                              shape: BoxShape.circle,
                            ),
                            child: controller.selestedImagePath.value == ''
                                //child: controller.isprofilepicpathset == true
                                ? Image.asset(
                                    AssetPaths.PERSON_IMAGE,
                                  )
                                : Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: FileImage(
                                            File(
                                              
                                              controller.selestedImagePath.value,
                                            ),
                                          ) as ImageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                            // backgroundImage: controller.selestedImagePath.value == ''
                            // ? Image.asset(
                            //         AssetPaths.PERSON_IMAGE,
                            //       )
                            //       : Image.file(File(controller.selestedImagePath.value))
                          ),
                          // Container(
                          //   width: 150.0,
                          //   height: 150.0,
                          //   decoration: const BoxDecoration(
                          //     color: AppColors.DARK_BROWN_COLOR,
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: ,
                          //   // child: controller.selestedImagePath.value == ''
                          //   //     ? Image.asset(
                          //   //         AssetPaths.PERSON_IMAGE,
                          //   //       )
                          //   //     : Container(
                          //   //         height: 100,
                          //   //         width: 100,
                          //   //         decoration: const BoxDecoration(
                          //   //           shape: BoxShape.circle,
                          //   //         ),
                          //   //         child: Image.file(
                          //   //           File(controller.selestedImagePath.value),
                          //   //           scale: 5,
                          //   //         ),
                          //   //       ),
                          // ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => bottomsheet(context));
                                  //controller.getImageFromGallery();
                                  //controller.getImage(ImageSource.gallery);
                                  //controller.takephoto(ImageSource.gallery);
                                },
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
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.FULL_NAME_TEXT,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // decoration: TextDecoration.underline,
                        //decorationThickness: 0.6,
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                  ),
                  
                  AppTextField(
                    //txtController: TextEditingController(text: box.read("full_name")),
                    txtController: controller.fullNameController,
                    //hinttxt: box.read("full_name"),
                    onSaved: (value) {
                      controller.fullName = value!;
                    },
                    validator: (value) {
                      return FieldValidator.validateName(value!);
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.EMAIL_TEXT,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // decoration: TextDecoration.underline,
                        //decorationThickness: 0.6,
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                  ),
                  AppTextField(
                    enabled: false,
                    isDisable: true,
                    onSaved: (value) {},
                    hinttxt: box.read("user_email"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppStrings.NUMBER_TEXT,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        // decoration: TextDecoration.underline,
                        //decorationThickness: 0.6,
                        color: AppColors.BLACK_COLOR,
                      ),
                    ),
                  ),
                  AppTextField(
                    enabled: false,
                    isDisable: true,
                    onSaved: (value) {},
                    hinttxt: box.read("number").toString(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  AppButton(
                    txt: AppStrings.SAVE_TEXT,
                    color: AppColors.secondaryColor,
                    txtcolor: Colors.white,
                    prefixicon: false,
                    onclick: () {
                      //controller.selestedImagePath.value = '';
                      FocusManager.instance.primaryFocus?.unfocus();
                      //controller.uploadImage();
                      controller.uploadImage();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      txt: AppStrings.EDIT_PROFILE_TEXT,
    );
  }

  //======================BOTTOM SHEET==================
  bottomsheet(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      height: MediaQuery.of(context).size.height * 0.20,
      width: double.infinity,
      // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              print("camera");
              controller.getImage(ImageSource.camera);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.WHITE_COLOR,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                  // CustomText(
                  //   maintext: "CAMERA",
                  //   // fontsize: 20.sp,
                  //   color: AppColors.WHITE_COLOR,
                  //   // fontWeight: FontWeight.bold,
                  // ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColors.WHITE_COLOR,
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              print("gallery");
              controller.getImage(ImageSource.gallery);
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 8.0, right: 8.0, bottom: 5.0),
              child: Row(
                children: const [
                  Icon(Icons.image, color: AppColors.WHITE_COLOR),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
