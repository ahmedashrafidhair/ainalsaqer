import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import '../config/app_text_styles.dart';
import '../extensions/color.dart';

class CommonStyle {
  static InputDecoration textFieldStyle({String hintTextStr = ""}) {
    return InputDecoration(
      hintText: hintTextStr,
      isDense: true,
      filled: false,
      fillColor: AppColors.lightGrey6,
      hintStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.text19,
      ),
      errorStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: AppTextStyles.regularTextStyle.copyWith(fontSize: 12.0.sp),
      contentPadding:
          EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.0.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide:
            BorderSide(width: 0.3.w, color: AppColors.divider1), //<-- SEE HERE
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide:
            BorderSide(width: 0.3.w, color: AppColors.divider1), //<-- SEE HERE
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide:
            BorderSide(width: 1.w, color: AppColors.primary), //<-- SEE HERE
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide: BorderSide(width: 0.3.w, color: AppColors.divider1), //<--
      ), //<-- SEE HERE
    );
  }

  static InputDecoration textFieldContactUsStyle({String hintTextStr = ""}) {
    return InputDecoration(
      hintText: hintTextStr,
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      hintStyle: AppTextStyles.regularTextStyle
          .copyWith(fontSize: 12.0.sp, color: AppColors.text19),
      errorStyle: AppTextStyles.regularTextStyle.copyWith(
        fontSize: 12.0.sp,
      ),
      labelStyle: AppTextStyles.regularTextStyle.copyWith(fontSize: 12.0.sp),
      contentPadding:
          EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.0.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide:
            BorderSide(width: 0.3.w, color: Colors.white), //<-- SEE HERE
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide:
            BorderSide(width: 0.3.w, color: Colors.white), //<-- SEE HERE
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide:
            BorderSide(width: 1.w, color: AppColors.primary), //<-- SEE HERE
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0.r),
        borderSide: BorderSide(width: 0.3.w, color: Colors.white), //<--
      ), //<-- SEE HERE
    );
  }

  static InputDecoration textFieldSearchStyle({String hintTextStr = ""}) {
    return InputDecoration(
      filled: false,
      isDense: true,
      fillColor: HexColor("F5F5F5"),
      hintText: hintTextStr,
      hintStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.text19,
      ),
      errorStyle: TextStyle(
        fontFamily: 'Cairo',
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: AppTextStyles.regularTextStyle.copyWith(fontSize: 14.0.sp),
      contentPadding:
          EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 10.0.h),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0.r),
        borderSide:
            BorderSide(width: 0.3.w, color: AppColors.divider1), //<-- SEE HERE
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0.r),
        borderSide:
            BorderSide(width: 0.3.w, color: AppColors.divider1), //<-- SEE HERE
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0.r),
        borderSide:
            BorderSide(width: 1.w, color: AppColors.primary), //<-- SEE HERE
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0.r),
        borderSide: BorderSide(width: 0.3.w, color: AppColors.divider1), //<--
      ), //<-- SEE HERE
    );
  }

  static SnackbarController customSnackbar(
      {String msg = "", String title = ""}) {
    return Get.snackbar(
      title,
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.black.withOpacity(0.5),
      snackPosition: SnackPosition.TOP,
    );
  }

  static defaultDialog({String msg = "", String title = "خطا"}) {
    return Get.defaultDialog(
      title: "خطا",
      middleText: msg,
      cancel: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("الغاء")),
    );
  }
}
