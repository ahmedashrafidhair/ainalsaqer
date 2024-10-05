import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../app/components/custom_app_bar.dart';
import '../../../app/components/custom_primary_button.dart';
import '../../../app/components/custom_text.dart';
import '../../../app/components/custom_text_form_field.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/translations/lang_keys.dart';
import '../controller/change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  ChangePasswordController controller = Get.put(ChangePasswordController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
              centerTitle: false,
              isShowBack: true,
              title: LangKeys.changePassword.tr),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.0.h),
                  Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          _buildLabelWithAsterisk(LangKeys.currentPassword.tr),
                          8.verticalSpace,
                          Obx(
                            () => CustomTextFormField(
                                label: LangKeys.currentPassword.tr,
                                keyboardType: TextInputType.text,
                                hintTxt: LangKeys.enterCurrentPassword.tr,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return LangKeys.enterCurrentPassword.tr;
                                  }
                                  return null;
                                },
                                isPassword: controller.obscureText.value,
                                isShowIconPassword: true,
                                onTogglePassword: () {
                                  controller.obscureText(
                                      !controller.obscureText.value);
                                },
                                controller: controller.currentPassword),
                          ),
                          12.verticalSpace,
                          _buildLabelWithAsterisk(LangKeys.newPassword.tr),
                          8.verticalSpace,
                          Obx(
                            () => CustomTextFormField(
                                label: LangKeys.newPassword.tr,
                                keyboardType: TextInputType.text,
                                hintTxt: LangKeys.enterNewPassword.tr,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return LangKeys.enterNewPassword.tr;
                                  }
                                  if (value != controller.confirmNewPassword.text) {
                                    return LangKeys.passwordNotMatch.tr;
                                  }
                                  return null;
                                },
                                isPassword: controller.obscureText.value,
                                isShowIconPassword: true,
                                onTogglePassword: () {
                                  controller.obscureText(
                                      !controller.obscureText.value);
                                },
                                controller: controller.newPassword),
                          ),
                          12.verticalSpace,
                          _buildLabelWithAsterisk(
                              LangKeys.confirmNewPassword.tr),
                          8.verticalSpace,
                          Obx(
                            () => CustomTextFormField(
                                label: LangKeys.confirmNewPassword.tr,
                                keyboardType: TextInputType.text,
                                hintTxt: LangKeys.enterConfirmNewPassword.tr,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return LangKeys.enterConfirmNewPassword.tr;
                                  }
                                  if (value != controller.newPassword.text) {
                                    return LangKeys.passwordNotMatch.tr;
                                  }
                                  return null;
                                },
                                isPassword: controller.obscureText.value,
                                isShowIconPassword: true,
                                onTogglePassword: () {
                                  controller.obscureText(
                                      !controller.obscureText.value);
                                },
                                controller: controller.confirmNewPassword),
                          ),
                          40.verticalSpace,
                          CustomPrimaryButton(
                            text: LangKeys.changePassword.tr,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.changePassword();
                              }
                              // controller.validation();

                              // Get.toNamed(AppRoutes.home);
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )),
    );
  }

  // Helper function to build the label with an asterisk
  Widget _buildLabelWithAsterisk(String label) {
    return Row(
      children: [
        CustomText(
          text: label,
          fontSize: 15.0.sp,
          height: 0,
          fontWeight: FontWeight.w500,
        ),
        CustomText(
          text: "*",
          fontSize: 15.0.sp,
          height: 0.06,
          color: AppColors.redColor1,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
