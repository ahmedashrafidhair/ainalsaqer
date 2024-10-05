import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../ui/public_controller.dart';
import '../services/storage_service.dart';
import '../util/bottom_sheet.dart';
import '../util/utils.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;

  var storageService = Get.find<StorageService>();

  CustomHomeAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgColor,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(Utils.getIconPath("ic_profile_toolbar"),
              width: 24.w, height: 24.h),
          onPressed: () async {
            // Get.toNamed(AppRoutes.settingsPage);
          },
        )
      ],
      leading: IconButton(
        icon: Stack(
          children: [
            IconButton(
                icon: SvgPicture.asset(
                    Utils.getIconPath("ic_notification_toolbar"),
                    width: 73.w,
                    height: 47.h),
                onPressed: () {
                  if (storageService.isAuth()) {
                    // Get.toNamed(AppRoutes.notifications);
                  } else {
                    confirmBottomSheet();
                  }
                }),
            Obx(() => Get.find<PublicController>().notCount.value != 0
                ? PositionedDirectional(
                    start: 7.w,
                    top: 5.h,
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0.w,
                        ),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14.w,
                        minHeight: 14.h,
                      ),
                      child: CustomText(
                        text: '${Get.find<PublicController>().notCount.value}',
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : const SizedBox()),
          ],
        ),
        onPressed: () {
          // do something
        },
      ),
      title: SvgPicture.asset(Utils.getIconPath("ic_logo_toolbar"),
          width: 40.w, height: 40.h),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
