import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';

import '../../Utils/app_strings.dart';

class MapContainer extends StatefulWidget {
  final String? restName;
  final String? mondayTiming;
  final String? tuesTiming;
  final String? wedTiming;
  final String? thursTiming;
  final String? friTiming;
  final String? satTiming;
  final String? sunTiming;
  final int? contactNumber;
  final String? contactEmail;
  final double? longitutde;
  final double? latitude;
  const MapContainer({
    Key? key,
    this.restName,
    this.mondayTiming,
    this.tuesTiming,
    this.wedTiming,
    this.thursTiming,
    this.friTiming,
    this.satTiming,
    this.sunTiming,
    this.contactNumber,
    this.contactEmail,
    this.longitutde,
    this.latitude,
  }) : super(key: key);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {

  List<Marker> _markers = [];
  late CameraPosition map;

  @override
  void initState() {
    map = CameraPosition(
      target: LatLng(
        //25.013176,67.314583
        widget.latitude!, widget.longitutde!
      ),
      //double.parse()
      zoom: 14,
    );

    _markers.add(
      Marker(
        markerId: MarkerId("SomeId"),
        position: LatLng(
          //25.013176,67.314583
          widget.latitude!, widget.longitutde!
        ),
      )
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Container(
          //height: 400,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.WHITE_COLOR,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.restName!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                      //decorationThickness: 0.6,
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // image: DecorationImage(
                    //     image: AssetImage(
                    //       AssetPaths.MAP_IMAGE,
                    //     ),
                    //     fit: BoxFit.cover),
                  ),
                  child: GoogleMap(
                    initialCameraPosition: map,
                    markers: Set<Marker>.of(_markers),
                  ),
                  // child: Image.asset(
                  //   AssetPaths.MAP_IMAGE,
                  //   fit: BoxFit.fill,
                  // ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.TIMINGS_TEXT,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "Monday " + widget.mondayTiming!,
                          //widget.timings!,
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "Tuesday " + widget.tuesTiming!,
                          //widget.timings!,
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "Wednessday " + widget.wedTiming!,
                          //widget.timings!,
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "Thursday " + widget.thursTiming!,
                          //widget.timings!,
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "Friday " + widget.friTiming!,
                          //widget.timings!,
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "Saturday " + widget.satTiming!,
                          //widget.timings!,
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          "Sunday " + widget.sunTiming!,
                          //widget.timings!,
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.CONTACT_TEXT,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Text(
                          widget.contactNumber!.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            decorationThickness: 0.6,
                            color: AppColors.BLACK_COLOR,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Text(
                            widget.contactEmail!,
                            style: const TextStyle(
                              fontSize: 14,
                              decorationThickness: 0.6,
                              color: AppColors.BLACK_COLOR,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
