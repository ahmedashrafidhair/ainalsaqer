import 'package:ainalsaqer/app/components/empty_status_view.dart';
import 'package:ainalsaqer/app/components/loading_view.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/ui/order_details/controller/order_details_controller.dart';
import 'package:ainalsaqer/ui/order_details/view/order_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/components/custom_app_bar.dart';
import '../../../app/components/custom_primary_button.dart';
import '../../../app/translations/lang_keys.dart';
import '../../my_orders/view/widget/filter_chip_widget.dart';
import 'order_history.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({super.key});

  OrderDetailsController controller = Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
          centerTitle: false,
          isShowBack: true,
          title: "${LangKeys.order.tr} ${controller.docCode.value}"),
      body: Padding(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Column(
          children: [
            Obx(
              () => Row(
                children: [
                  Expanded(
                      child: FilterChipWidget(
                    label: LangKeys.orderDetails.tr,
                    isActive: controller.screen.value == 1,
                    onSelected: (selected) {
                      controller.screen(1);
                      controller.update(["updateDetails"]);
                    },
                  )),
                  Expanded(
                      child: FilterChipWidget(
                    label: LangKeys.orderHistory.tr,
                    isActive: controller.screen.value == 2,
                    onSelected: (selected) {
                      controller.screen(2);
                      controller.update(["updateDetails"]);
                    },
                  )),
                ],
              ),
            ),
            Expanded(
                child: GetBuilder<OrderDetailsController>(
              id: "updateDetails",
              builder: (controller) {
                if (controller.isLoading.isTrue) {
                  return const Center(child: LoadingView());
                }
                if (controller.orderDetails.id == null ||
                    controller.orderDetails.id == "") {
                  return EmptyStatusView(msg: LangKeys.noData.tr);
                }
                return controller.screen.value == 1
                    ? OrderDetailsPage()
                    : OrderHistory();
              },
            )),
            CustomPrimaryButton(
              text: LangKeys.delivered.tr,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
