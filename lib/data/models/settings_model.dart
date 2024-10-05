import 'package:flutter/material.dart';

class SettingsModel {
  final String icon;
  final String title;
  final Function() onTap;
  final Color? textColor;
  final bool? isLast;

  SettingsModel({
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
    this.isLast = false,
  });
}
