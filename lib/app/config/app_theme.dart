import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'font_manager.dart';

var lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: FontConstants.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: AppColors.primary,
    datePickerTheme:
        DatePickerThemeData(headerBackgroundColor: AppColors.primary),
    textTheme: TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 32.0.sp),
      displayMedium: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w600, fontSize: 28.0.sp),
      displaySmall: TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.normal,
          fontSize: 24.0.sp),
      headlineLarge: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w500, fontSize: 20.0.sp),
      headlineMedium: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w400, fontSize: 18.0.sp),
      headlineSmall: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w300, fontSize: 16.0.sp),
      bodyLarge: TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.normal,
          fontSize: 16.0.sp),
      bodyMedium: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w300, fontSize: 14.0.sp),
      bodySmall: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w200, fontSize: 12.0.sp),
      labelLarge: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 14.0.sp),
      labelMedium: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w500, fontSize: 12.0.sp),
      labelSmall: TextStyle(
          fontFamily: 'Cairo', fontWeight: FontWeight.w400, fontSize: 10.0.sp),
    ),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white, // Only honored in Android M and above
          statusBarIconBrightness:
              Brightness.dark, // Only honored in Android M and above
          statusBarBrightness:
              Brightness.light, // Only honored in iOSS (dark icons)
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        titleSpacing: 0.0));
