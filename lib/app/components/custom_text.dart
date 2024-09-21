import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int? maxLines; // Optional max lines
  final double? height; // Optional max lines
  final TextOverflow? overflow; // Optiona

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16.0,
    this.maxLines,
    this.height,
    this.overflow,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: fontSize,
        overflow: overflow,
        height: height,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
