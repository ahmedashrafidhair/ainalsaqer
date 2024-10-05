import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool? isShowBack;
  bool? centerTitle;
  bool isGrayBg;

  CustomAppBar(
      {required this.title,
      this.isShowBack = false,
      this.isGrayBg = false,
      this.centerTitle = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      backgroundColor: isGrayBg ? AppColors.lightGrey6 : Colors.white,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      leading: isShowBack == true
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 24.0.r,
                color: Colors.black,
              ),
              onPressed: () async {
                Get.back();
              },
            )
          : null,
      title:
          CustomText(text: title, fontSize: 18.sp, fontWeight: FontWeight.w600),
    ));
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
