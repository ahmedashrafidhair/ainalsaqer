import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';
import '../util/common_style.dart';
import '../util/form_validator.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintTxt;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  bool? isPassword;
  bool? isShowIconPassword;
  final bool isRequired;
  final VoidCallback? onTogglePassword;
  final String? Function(String?)? validator;

  CustomTextFormField({
    super.key,
    required this.label,
    required this.hintTxt,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.isShowIconPassword = false,
    this.isRequired = true,
    this.onTogglePassword,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the PasswordController if this is a password field
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword ?? false,
        obscuringCharacter: "*",
        textInputAction: textInputAction,
        // Control visibility
        decoration: CommonStyle.textFieldStyle(hintTextStr: hintTxt).copyWith(
          suffixIcon: isShowIconPassword ?? false
              ? Padding(
                  padding: EdgeInsetsDirectional.only(end: 0.0.w),
                  child: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        isPassword ?? false
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 24.0.r,
                        color: isPassword ?? false
                            ? AppColors.grey
                            : AppColors.primary,
                      ),
                      onPressed: onTogglePassword),
                )
              : null, // Sh
        ),
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          if (isRequired) {
            return FormValidator.validateRequired(value, fieldName: label);
          }
          return null;
        });
  }
}
