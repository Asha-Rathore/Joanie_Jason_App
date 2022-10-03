import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Selections/Controller/get_restaurant_controller.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../widgets/map_container.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  GetRestaurantController getRestaurantController =
      Get.put(GetRestaurantController());

  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      screenChild: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: getRestaurantController.getRestaurantList.length,
                      itemBuilder: (context, index) {
                        return MapContainer(
                          restName: getRestaurantController.getRestaurantList[index].restName,
                          contactNumber: getRestaurantController.getRestaurantList[index].number,
                          contactEmail: getRestaurantController.getRestaurantList[index].email,
                          mondayTiming: getRestaurantController.getRestaurantList[index].timing!.monday!,
                          tuesTiming: getRestaurantController.getRestaurantList[index].timing!.tuesday,
                          wedTiming: getRestaurantController.getRestaurantList[index].timing!.wednesday,
                          thursTiming: getRestaurantController.getRestaurantList[index].timing!.thursday,
                          friTiming: getRestaurantController.getRestaurantList[index].timing!.friday,
                          satTiming: getRestaurantController.getRestaurantList[index].timing!.saturday,
                          sunTiming: getRestaurantController.getRestaurantList[index].timing!.sunday,
                          longitutde: double.parse(getRestaurantController.getRestaurantList[index].location!.longitude!),
                          latitude: double.parse(getRestaurantController.getRestaurantList[index].location!.latitude!),
                        );
                      },
                    ),
                  ),
                ),
              )
        
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // const MapContainer(
              //   restName: AppStrings.LOCATION_2_TEXT,
              // ),
            ],
          ),
        ),
      ),
      txt: AppStrings.CONTACT_US_TEXT,
    );
  }
}
