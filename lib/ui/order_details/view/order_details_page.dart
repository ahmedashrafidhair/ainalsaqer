import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:ainalsaqer/ui/order_details/controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/components/custom_text.dart';
import '../../../app/extensions/color.dart';
import '../../../app/util/utils.dart';

class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({super.key});

  OrderDetailsController controller = Get.find<OrderDetailsController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.verticalSpace,
          CustomText(
              text: LangKeys.orderDetails.tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              height: 0),
          Container(
            padding: EdgeInsetsDirectional.only(
                start: 12.w, top: 16.h, bottom: 16.h, end: 16.w),
            margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 16.h),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.50.w, color: Colors.black),
                borderRadius: BorderRadius.circular(4.r),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.orderDate.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: Utils.formatDate(
                                controller.orderDetails.scheduleDate ?? "",
                                format: "yyyy/MM/dd"),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.orderTime.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: Utils.formatDate(
                                controller.orderDetails.scheduleDate ?? "",
                                format: "hh:mm a"),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                3.verticalSpace,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${LangKeys.serviceType.tr} : ",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          height: 0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: Utils.serviceType(
                            controller.orderDetails.serviceType ?? 0),
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          height: 0,
                          fontWeight: FontWeight.w400,
                          color: HexColor("FE1111"),
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
                        text:
                            "${LangKeys.orderCreatorBranch.tr} ${controller.orderDetails.company} : ",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          height: 0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: controller.orderDetails.actionByName ?? "",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          height: 0,
                          fontWeight: FontWeight.w400,
                          color: HexColor("747474"),
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
                        text: "${LangKeys.sourceOrderSection.tr} : ",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          height: 0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: Utils.orderDepartment(
                            controller.orderDetails.department ?? 0),
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13.sp,
                          height: 0,
                          fontWeight: FontWeight.w400,
                          color: HexColor("747474"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomText(
              text: LangKeys.orderReceiptAndDeliveryData.tr,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
              height: 0),
          // from Branch
          Visibility(
              visible: controller.orderDetails.fromBranch != null,
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 12.w, top: 8.h, bottom: 8.h, end: 12.w),
                margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.30.w, color: const Color(0xFF989898)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.fromBranch.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.fromBranch?.branch ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
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
                            text: "${LangKeys.company.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.fromBranch?.company ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.emirate.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.fromBranch?.emirate ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.region.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.fromBranch?.region ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.address.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.fromBranch?.address ??
                                "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.location.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.fromBranch?.addressUrl ??
                                "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.phone.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.fromBranch
                                    ?.branchPhoneNumber ??
                                "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          // to Branch
          Visibility(
              visible: controller.orderDetails.toBranch != null,
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    start: 12.w, top: 8.h, bottom: 8.h, end: 12.w),
                margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.30.w, color: const Color(0xFF989898)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.toBranch.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.toBranch?.branch ?? "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
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
                            text: "${LangKeys.company.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.toBranch?.company ?? "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.emirate.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.toBranch?.emirate ?? "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.region.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.toBranch?.region ?? "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.address.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.toBranch?.address ??
                                "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.location.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.toBranch?.addressUrl ??
                                    "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.phone.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.toBranch?.branchPhoneNumber ??
                                "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          // vehicle
          Visibility(
              visible: controller.orderDetails.vehicle != null,
              child: Container(
                width: ScreenUtil().screenWidth,
                padding: EdgeInsetsDirectional.only(
                    start: 12.w, top: 8.h, bottom: 8.h, end: 12.w),
                margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.30.w, color: const Color(0xFF989898)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.vehicleData.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
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
                            text: "${LangKeys.chassisNumber.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.vehicle?.number ?? "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.plateNumber.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.vehicle?.platNumber ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.vehicleCategory.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.vehicle?.vehicleCategory ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.vehicleType.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.vehicle?.vehicleType ??
                                    "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          // from customer
          Visibility(
              visible: controller.orderDetails.fromCustomer != null,
              child: Container(
                width: ScreenUtil().screenWidth,
                padding: EdgeInsetsDirectional.only(
                    start: 12.w, top: 8.h, bottom: 8.h, end: 12.w),
                margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.30.w, color: const Color(0xFF989898)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.customerData.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
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
                            text: "${LangKeys.name.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.fromCustomer?.fullName ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.email.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller.orderDetails.fromCustomer?.email ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.phoneNumber.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.fromCustomer?.phoneNumber ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.phoneNumber2.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.fromCustomer?.phoneNumber2 ??
                                "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          // to customer
          Visibility(
              visible: controller.orderDetails.toCustomer != null,
              child: Container(
                width: ScreenUtil().screenWidth,
                padding: EdgeInsetsDirectional.only(
                    start: 12.w, top: 8.h, bottom: 8.h, end: 12.w),
                margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.30.w, color: const Color(0xFF989898)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.customerData.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
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
                            text: "${LangKeys.name.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.toCustomer?.fullName ??
                                    "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.email.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                controller.orderDetails.toCustomer?.email ?? "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.phoneNumber.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.toCustomer?.phoneNumber ??
                                "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
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
                            text: "${LangKeys.phoneNumber2.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: controller
                                    .orderDetails.toCustomer?.phoneNumber2 ??
                                "--",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),

          // notes
          Visibility(
              visible: controller.orderDetails.remarks != null &&
                  controller.orderDetails.remarks != "",
              child: Container(
                width: ScreenUtil().screenWidth,
                padding: EdgeInsetsDirectional.only(
                    start: 12.w, top: 8.h, bottom: 8.h, end: 12.w),
                margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 16.h),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 0.30.w, color: const Color(0xFF989898)),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.notes.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: controller.orderDetails.remarks ?? "",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13.sp,
                              height: 0,
                              fontWeight: FontWeight.w400,
                              color: HexColor("747474"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
