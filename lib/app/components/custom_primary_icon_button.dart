import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomPrimaryIconButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color; // Optional color parameter
  final Color? textColor; // Optional text color parameter
  final double? elevation; // Optional elevation for shadow
  final double? width; // Optional width
  final double? height; // Optional height
  final double? borderRadius;
  final double? fontSize;
  final IconData icon;

  const CustomPrimaryIconButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.color,
    this.textColor,
    this.elevation,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? ScreenUtil().screenWidth, // Default to full width
      height: height ?? 40.0.h, // Default height
      child: Directionality(
          textDirection: Get.find<StorageService>().getLanguageCode() == "ar"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: ElevatedButton.icon(
            icon: Icon(icon, size: 20.r),
            style: ElevatedButton.styleFrom(
              foregroundColor: textColor ?? Colors.white,
              backgroundColor: color ?? AppColors.primary, // Default text color
              elevation: elevation ?? 2.0, // Default elevation
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 6.r)),
            ),
            onPressed: onPressed,
            label: Text(
              text,
              style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: fontSize ?? 14.sp,
                fontWeight: FontWeight.w600,
              ), // Default font size
            ),
          )),
    );
  }
}
