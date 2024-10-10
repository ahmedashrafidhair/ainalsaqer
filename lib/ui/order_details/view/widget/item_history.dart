import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/app/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/components/custom_text.dart';
import '../../../../app/translations/lang_keys.dart';
import '../../../../data/models/order_details/history.dart';

class ItemHistory extends StatelessWidget {
  final History data;

  const ItemHistory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle, size: 12.r, color: HexColor("E3E3E3")),
                    VerticalDivider(
                      color: AppColors.red,
                      thickness: 1.w,
                    )
                  ],
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 11.5.w, vertical: 4.h),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF837F0F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: CustomText(
                          text: Utils.orderStatus(data.status ?? 0),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 0),
                    ),
                    10.verticalSpace,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${LangKeys.date.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: Utils.formatDate(data.createDate ?? ""),
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: HexColor("626262"),
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
                            text: "${LangKeys.duration.tr} : ",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                "${data.duration} ${LangKeys.minute.tr}",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12.sp,
                              height: 0,
                              fontWeight: FontWeight.w500,
                              color: HexColor("626262"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                        text: data.remarks ?? "",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                        height: 0),
                  ],
                ),
              ),
            ],
          ),
          19.verticalSpace,
        ],
      ),
    );
  }
}
