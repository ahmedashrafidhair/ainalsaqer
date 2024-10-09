import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/ui/add_expense/controller/add_expense_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/components/custom_app_bar.dart';
import '../../../app/components/custom_primary_button.dart';
import '../../../app/components/custom_text_form_field.dart';
import '../../../app/components/loading_view.dart';
import '../../../app/translations/lang_keys.dart';
import '../../../app/util/common_style.dart';
import '../../../app/util/utils.dart';
import '../../../data/models/expense/expense.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key});

  AddExpenseController controller = Get.put(AddExpenseController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
          centerTitle: false, isShowBack: true, title: LangKeys.addExpense.tr),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 16.w, end: 16.w, top: 16.h, bottom: 16.h),
          child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: LangKeys.expenseInformation.tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      height: 0,
                      color: HexColor("19123C")),
                  CustomText(
                      text: LangKeys.expenseInformationMsg.tr,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      height: 0,
                      color: HexColor("B6B6B6")),
                  12.verticalSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LangKeys.selectTypeExpenseFinancialClaim.tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0.06,
                            fontWeight: FontWeight.w400,
                            color: AppColors.redColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  GetBuilder<AddExpenseController>(
                    id: "selectedExpense",
                    builder: (controller) {
                      return controller.isLoading.isFalse
                          ? controller.expenseList.isNotEmpty
                              ? DropdownSearch<Expense>(
                                  popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      searchFieldProps: TextFieldProps(
                                          decoration:
                                              CommonStyle.textFieldStyle(
                                                  hintTextStr:
                                                      LangKeys.search.tr)),
                                      menuProps: MenuProps(
                                          backgroundColor: Colors.white,
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                                  bottomStart:
                                                      Radius.circular(6.r),
                                                  bottomEnd:
                                                      Radius.circular(6.r)),
                                          barrierDismissible: true)
                                      // showSelectedItems: true,
                                      ),
                                  items: controller.expenseList,
                                  itemAsString: (Expense u) => u.name ?? "",
                                  dropdownButtonProps: DropdownButtonProps(
                                      icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: HexColor("B0B0B0"),
                                  )),
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration:
                                        CommonStyle.textFieldStyle(
                                            hintTextStr:
                                                LangKeys.selectTypeExpense.tr),
                                  ),
                                  onSaved: (c) {},
                                  onChanged: (data) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    if (data != null) {
                                      controller.selectedExpense.value = data;
                                      print("Log name ${data.name}");
                                    }
                                  },
                                  selectedItem:
                                      controller.selectedExpense.value,
                                )
                              : const SizedBox()
                          : const LoadingView();
                    },
                  ),
                  12.verticalSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LangKeys.orderNumber.tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0.06,
                            fontWeight: FontWeight.w400,
                            color: AppColors.redColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  CustomTextFormField(
                      label: LangKeys.orderNumber.tr,
                      keyboardType: TextInputType.text,
                      hintTxt: "000000",
                      isRequired: false,
                      controller: controller.orderNumber),
                  12.verticalSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LangKeys.billNumber.tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0.06,
                            fontWeight: FontWeight.w400,
                            color: AppColors.redColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  CustomTextFormField(
                      label: LangKeys.billNumber.tr,
                      keyboardType: TextInputType.text,
                      hintTxt: "000000",
                      isRequired: true,
                      controller: controller.billNumber),
                  12.verticalSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LangKeys.value.tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "*",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0.06,
                            fontWeight: FontWeight.w400,
                            color: AppColors.redColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  CustomTextFormField(
                      label: LangKeys.value.tr,
                      keyboardType: TextInputType.number,
                      hintTxt: "000000",
                      isRequired: true,
                      controller: controller.value),
                  12.verticalSpace,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LangKeys.notes.tr,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15.sp,
                            height: 0.06,
                            fontWeight: FontWeight.w400,
                            color: AppColors.redColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  CustomTextFormField(
                      label: LangKeys.notes.tr,
                      keyboardType: TextInputType.text,
                      hintTxt: LangKeys.pleaseWriteCommentsHere.tr,
                      isRequired: false,
                      minLines: 3,
                      controller: controller.notes),
                  18.verticalSpace,
                  GetBuilder<AddExpenseController>(
                    id: "selectImage",
                    builder: (controller) {
                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.selectImage();
                            },
                            child: DottedBorder(
                                color: HexColor("585858"),
                                // Color of the border
                                strokeWidth: 0.3,
                                // Border width
                                dashPattern: [6, 3],
                                // Dash pattern, [6, 3] means 6px dash, 3px space
                                borderType: BorderType.RRect,
                                radius: Radius.circular(6.r),
                                child: Container(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      vertical: 21.h),
                                  width: ScreenUtil().screenWidth,
                                  alignment: AlignmentDirectional.center,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     border: Border.none,
                                  //     borderRadius: BorderRadius.circular(6.r)),
                                  child: Column(children: [
                                    SvgPicture.asset(
                                        Utils.getIconPath("ic_upload_file"),
                                        width: 32.w,
                                        height: 32.h),
                                    SizedBox(height: 11.0.h),
                                    CustomText(
                                      text: controller.saveFile != null
                                          ? controller.saveFile!.name ?? ""
                                          : LangKeys
                                              .attachPictureDocumentHere.tr,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor("BDBDBD"),
                                    )
                                  ]),
                                )),
                          ),
                          controller.saveFile != null
                              ? PositionedDirectional(
                                  top: -20.0.h,
                                  end: -18.0.w,
                                  child: IconButton(
                                      onPressed: () {
                                        controller.deleteFile();
                                        // controller.update(['selectImage']);
                                      },
                                      icon: Image.asset(
                                          Utils.getImagePath("ic_close"),
                                          width: 25.0.w,
                                          height: 25.0.h)),
                                )
                              : const SizedBox()
                        ],
                      );
                    },
                  ),
                  50.verticalSpace,
                  CustomPrimaryButton(
                    text: LangKeys.add.tr,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.addDriverExpense();
                      }
                      // controller.validation();

                      // Get.toNamed(AppRoutes.home);
                    },
                  ),
                  25.verticalSpace,
                ],
              )),
        ),
      ),
    );
  }
}
