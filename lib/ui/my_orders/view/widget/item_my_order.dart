import 'package:ainalsaqer/app/components/custom_primary_icon_button.dart';
import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/app/routes/app_routes.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:ainalsaqer/app/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/models/order/order.dart';

class ItemMyOrder extends StatelessWidget {
  final Order order;

  const ItemMyOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 0.4.w),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            start: 12.w, end: 12.w, top: 10.h, bottom: 11.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: "${LangKeys.order.tr} ${order.docCode}",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 0),
            5.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${LangKeys.orderDate.tr} : ",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w700,
                      color: HexColor("4F4F4F"),
                    ),
                  ),
                  TextSpan(
                    text: Utils.formatDate(order.scheduleDate ?? ""),
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w500,
                      color: HexColor("7A7A7A"),
                    ),
                  ),
                  // TextSpan(
                  //   text: order.company ?? "",
                  //   style: TextStyle(
                  //     fontFamily: 'Cairo',
                  //     fontSize: 12.sp,
                  //     height: 0,
                  //     fontWeight: FontWeight.w700,
                  //     color: AppColors.primary,
                  //   ),
                  // ),
                ],
              ),
            ),
            3.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${LangKeys.orderType.tr} : ",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w700,
                      color: HexColor("4F4F4F"),
                    ),
                  ),
                  TextSpan(
                    text: Utils.orderType(order.dateType ?? 0),
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w500,
                      color: HexColor("7A7A7A"),
                    ),
                  ),
                ],
              ),
            ),
            3.verticalSpace,
            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: "${order.from ?? ""} ← ",
            //         style: TextStyle(
            //           fontFamily: 'Cairo',
            //           fontSize: 12.sp,
            //           height: 0,
            //           fontWeight: FontWeight.w700,
            //           color: AppColors.primary,
            //         ),
            //       ),
            //       TextSpan(
            //         text: order.to ?? "",
            //         style: TextStyle(
            //           fontFamily: 'Cairo',
            //           fontSize: 12.sp,
            //           height: 0,
            //           fontWeight: FontWeight.w700,
            //           color: AppColors.primary,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // 3.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${LangKeys.serviceType.tr} : ",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w700,
                      color: HexColor("4F4F4F"),
                    ),
                  ),
                  TextSpan(
                    text: Utils.serviceType(order.serviceType ?? 0),
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w500,
                      color: HexColor("E40000"),
                    ),
                  ),
                ],
              ),
            ),
            3.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${LangKeys.orderStatus.tr} : ",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w700,
                      color: HexColor("4F4F4F"),
                    ),
                  ),
                  TextSpan(
                    text: Utils.orderStatus(order.status ?? 0),
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 12.sp,
                      height: 0,
                      fontWeight: FontWeight.w500,
                      color: HexColor("E40000"),
                    ),
                  ),
                ],
              ),
            ),
            12.verticalSpace,
            CustomPrimaryIconButton(
              text: LangKeys.viewOrder.tr,
              onPressed: () {
                Get.toNamed(AppRoutes.orderDetails, arguments: {
                  "orderId": order.id ?? "",
                  "docCode": order.docCode ?? ""
                });
              },
              fontSize: 13.sp,
              color: Utils.getColorFromStatus(order.status ?? 0),
              icon: Icons.arrow_back,
            ),
          ],
        ),
      ),
    );
  }
}
