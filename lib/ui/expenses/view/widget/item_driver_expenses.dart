import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/models/driver_expenses/driver_expenses.dart';


class ItemDriverExpenses extends StatelessWidget {
  final DriverExpenses data;

  const ItemDriverExpenses({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
          start: 14.w, end: 14.w, top: 12.h, bottom: 12.h),
      margin: EdgeInsetsDirectional.only(bottom: 18.h),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.30.w, color: HexColor("19123C")),
          borderRadius: BorderRadius.circular(10.r),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: "${LangKeys.expense.tr} ${data.docCode}",
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: HexColor("2A2A2A"),
              height: 0),
          5.verticalSpace,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${LangKeys.typeExpense.tr} : ",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    height: 0,
                    fontWeight: FontWeight.w600,
                    color: HexColor("888888"),
                  ),
                ),
                TextSpan(
                  text: data.name ?? "",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    height: 0,
                    fontWeight: FontWeight.w500,
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
                  text: "${LangKeys.billNumber.tr} : ",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    height: 0,
                    fontWeight: FontWeight.w600,
                    color: HexColor("888888"),
                  ),
                ),
                TextSpan(
                  text: data.billNumber ?? "",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
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
                  text: "${LangKeys.price.tr} : ",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    height: 0,
                    fontWeight: FontWeight.w600,
                    color: HexColor("888888"),
                  ),
                ),
                TextSpan(
                  text: "${data.price.toString()} ${LangKeys.currency.tr}",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
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
                  text: "${LangKeys.expenseStatus.tr} : ",
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    height: 0,
                    fontWeight: FontWeight.w600,
                    color: HexColor("888888"),
                  ),
                ),
                TextSpan(
                  text: data.approved == true
                      ? LangKeys.approved.tr
                      : LangKeys.waiting.tr,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 12.sp,
                    height: 0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
