import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/components/custom_primary_button.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/extensions/color.dart';
import '../../../app/translations/lang_keys.dart';
import '../../../app/util/form_validator.dart';
import '../../../app/util/utils.dart';
import '../controller/sign_in_controller.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  SignInController controller = Get.put(SignInController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0.h),
                  SvgPicture.asset(Utils.getIconPath("ic_sign_in"),
                      width: 205.0.w, height: 205.0.h),
                  SizedBox(height: 14.h),
                  CustomText(
                      text: LangKeys.heyYou.tr,
                      fontSize: 15.0.sp,
                      fontWeight: FontWeight.w600),
                  5.verticalSpace,
                  CustomText(
                      text: LangKeys.signIn.tr,
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w700),
                  5.verticalSpace,
                  CustomText(
                      text: LangKeys.toContinueLogIn.tr,
                      fontSize: 13.0.sp,
                      color: HexColor("000B12").withOpacity(0.40),
                      fontWeight: FontWeight.w400),
                  21.verticalSpace,
                  Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                    text: LangKeys.email.tr,
                                    fontSize: 15.0.sp,
                                    height: 0,
                                    fontWeight: FontWeight.w500),
                                CustomText(
                                    text: "*",
                                    fontSize: 15.0.sp,
                                    height: 0.06,
                                    color: AppColors.redColor1,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            8.verticalSpace,
                            CustomTextFormField(
                                label: LangKeys.email.tr,
                                keyboardType: TextInputType.emailAddress,
                                hintTxt: LangKeys.enterEmail.tr,
                                validator: FormValidator.validateEmail,
                                controller: controller.email),
                            12.verticalSpace,
                            Row(
                              children: [
                                CustomText(
                                    text: LangKeys.password.tr,
                                    fontSize: 15.0.sp,
                                    height: 0,
                                    fontWeight: FontWeight.w500),
                                CustomText(
                                    text: "*",
                                    fontSize: 15.0.sp,
                                    height: 0.06,
                                    color: AppColors.redColor1,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            8.verticalSpace,
                            Obx(() => CustomTextFormField(
                                label: LangKeys.email.tr,
                                keyboardType: TextInputType.emailAddress,
                                hintTxt: LangKeys.enterEmail.tr,
                                isPassword: controller.obscureText.value,
                                isShowIconPassword: true,
                                onTogglePassword: () {
                                  controller.obscureText(
                                      !controller.obscureText.value);
                                },
                                validator: FormValidator.validatePassword,
                                controller: controller.password)),
                            SizedBox(height: 40.0.h),
                            CustomPrimaryButton(
                              text: LangKeys.signIn.tr,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.login();
                                }
                                // controller.validation();

                                // Get.toNamed(AppRoutes.home);
                              },
                            ),
                            SizedBox(height: 30.h),
                          ]))
                ],
              ),
            ),
          )),
        ));
  }
}
