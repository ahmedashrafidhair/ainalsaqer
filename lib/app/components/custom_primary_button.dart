import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color; // Optional color parameter
  final Color? textColor; // Optional text color parameter
  final double? elevation; // Optional elevation for shadow
  final double? width; // Optional width
  final double? height; // Optional height
  final double? borderRadius;
  final double? fontSize;

  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.elevation,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? ScreenUtil().screenWidth, // Default to full width
      height: height ?? 47.0.h, // Default height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor ?? Colors.white,
          backgroundColor: color ?? AppColors.primary, // Default text color
          elevation: elevation ?? 2.0, // Default elevation
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 6.r)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: fontSize ?? 16.sp,
            fontWeight: FontWeight.w600,
          ), // Default font size
        ),
      ),
    );
  }
}
