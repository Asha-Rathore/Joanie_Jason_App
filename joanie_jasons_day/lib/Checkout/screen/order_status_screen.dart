import 'package:flutter/material.dart';
import 'package:joanie_jasons_day/Utils/app_colors.dart';
import 'package:joanie_jasons_day/Utils/app_strings.dart';
import 'package:joanie_jasons_day/Utils/assets_path.dart';
import 'package:joanie_jasons_day/Widgets/app_template_inside.dart';

import '../../Widgets/app_buttons.dart';
import '../widget/line_widget.dart';
import '../widget/order_status_container.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return AppTemplateInside(
        screenChild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.ORDER_ID_TEXT,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decorationThickness: 0.6,
                color: AppColors.BLACK_COLOR,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const ContainerWidget(
              head: AppStrings.ORDER_CONFIRMATION_TEXT,
              time: AppStrings.ORDER_CONFIRMATION_DATE_TIME_TEXT,
              img: AssetPaths.ORDER_CONFIRMATION_IMAGE,
              color: AppColors.APP_DARK_COLOR,
            ),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const ContainerWidget(
              head: AppStrings.PREPARING_ORDER_TEXT,
              time: AppStrings.PREPARING_ORDER_DATE_TIME_TEXT,
              img: AssetPaths.PREPARING_ORDER_IMAGE,
              color: AppColors.WHITE_COLOR,
            ),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const LineWidget(),
            const ContainerWidget(
              head: AppStrings.ORDER_READY_TO_PICKUP_TEXT,
              time: AppStrings.ORDER_CONFIRMATION_DATE_TIME_TEXT,
              img: AssetPaths.ORDER_READY_TO_PICKUP_IMAGE,
              color: AppColors.WHITE_COLOR,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const AppButton(
              txt: AppStrings.CONFIRM_DELIVERY_TEXT,
              color: AppColors.secondaryColor,
              txtcolor: Colors.white,
              prefixicon: false,
            ),
          ],
        ),
        txt: AppStrings.ORDER_STATUS_TEXT);
  }
}
