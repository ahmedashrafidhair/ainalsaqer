import 'package:ainalsaqer/ui/order_details/view/widget/item_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/components/custom_text.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/translations/lang_keys.dart';
import '../controller/order_details_controller.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({super.key});

  OrderDetailsController controller = Get.find<OrderDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.verticalSpace,
        CustomText(
            text: LangKeys.orderHistory.tr,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
            height: 0),
        19.verticalSpace,
        Expanded(
            child: ListView.builder(
          itemCount: controller.orderDetails.history!.length,
          itemBuilder: (context, index) {
            return ItemHistory(
                data:
                    controller.orderDetails.history!.reversed.toList()[index]);
          },
        ))
      ],
    );
  }
}
