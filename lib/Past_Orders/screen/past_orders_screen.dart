import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joanie_jasons_day/Past_Orders/Controllers/get_past_orders_controller.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../../Utils/app_colors.dart';
import '../widgets/ongoing_container.dart';

class PastOrdersScreen extends StatefulWidget {
  const PastOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PastOrdersScreen> createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen> {
  @override
  void initState() {
    //  getPastOrdersController.getAllProducts();
    super.initState();
  }

  GetPastOrdersController getPastOrdersController =
      Get.put(GetPastOrdersController());

  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
      screenChild: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.PAST_ORDERS_TEXT,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decorationThickness: 0.6,
                      color: AppColors.BLACK_COLOR,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.02,
                // ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: GetBuilder<GetPastOrdersController>(
                      builder: (controller) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: GetPastOrdersController
                          .p.getPastOrderModel!.getOrders?.length,
                      itemBuilder: (context, index) {
                        final order = GetPastOrdersController
                            .p.getPastOrderModel?.getOrders?[index];
                        // return Container();
                        return GetPastOrdersController
                                .p.getPastOrderModel!.getOrders!.isEmpty
                            ? Container(
                                child: const Text(
                                "No Product found",
                                style: TextStyle(
                                  color: AppColors.BLACK_COLOR,
                                  fontSize: 18,
                                ),
                              ))
                            : Column(
                                children: [
                                  Text(
                                    "Order id: " + order!.orderId.toString(),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      // scrollDirection: Axis.vertical,
                                      itemCount: order.products!.length,
                                      itemBuilder: (context, i) {
                                        return OngoingContainer(
                                          txt: order.products![i].productId!
                                              .productName,
                                          price: order.products![i].productId!
                                              .productPrice!
                                              .toDouble(),
                                          desc: order.products![i].productId!
                                              .productDescription,
                                          image: order.products![i].productId!
                                              .productImage,
                                          time: getPastOrdersController.convertDate(
                                            order.createdAt!
                                          ),
                                          //  txt:  GetPastOrdersController.p.getPastOrderModel?.getOrders?[index].products?[index].productId?.productName,
                                          // price: GetPastOrdersController.p.getPastOrderModel?.getOrders?[index].products?[index].productId?.productPrice?.toDouble(),
                                        );
                                      }),
                                ],
                              );
                      },
                    );
                  }),
                ),

                // ),
                // const OngoingContainer(
                //   txt: AppStrings.COFFEE_TEXT,
                //   price: AppStrings.COFFEE_PAST_ORDERS_TEXT,
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.003,
                // ),
                // const OngoingContainer(
                //   txt: AppStrings.BREAKFAST_TEXT,
                //   price: AppStrings.BREAKFAST_PAST_ORDERS_TEXT,
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.003,
                // ),
                // const OngoingContainer(
                //   txt: AppStrings.COLD_BREW_TEXT,
                //   price: AppStrings.COLD_BREW_ONGOING_PRICE_TEXT,
                // ),
              ],
            ),
          ),
        ),
      ),
      txt: AppStrings.ORDERS_TEXT,
    );
  }
}
