import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../ui/public_controller.dart';
import '../config/app_text_styles.dart';
import '../extensions/color.dart';
import '../routes/app_routes.dart';
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
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Stack(
            children: [
              IconButton(
                  icon: SvgPicture.asset(Utils.getIconPath("ic_bell"),
                      width: 24.w, height: 24.h),
                  onPressed: () {
                    if (storageService.isAuth()) {
                      // Get.toNamed(AppRoutes.notifications);
                    } else {
                      confirmBottomSheet();
                    }
                  }),
              Obx(() => Get.find<PublicController>().notCount.value != 0
                  ? PositionedDirectional(
                      start: 9.w,
                      top: 5.h,
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: HexColor("F3F3F3"),
                            width: 1.0.w,
                          ),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14.w,
                          minHeight: 14.h,
                        ),
                        child: Text(
                          '${Get.find<PublicController>().notCount.value}',
                          style: AppTextStyles.semiBoldTextStyle
                              .copyWith(color: Colors.white, fontSize: 10.0.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox())
            ],
          ),
          onPressed: () {
            // do something
          },
        )
      ],
      leading: IconButton(
        icon: SvgPicture.asset(Utils.getIconPath("ic_settings"),
            width: 24.w, height: 24.h),
        onPressed: () async {
          // Get.toNamed(AppRoutes.settingsPage);
        },
      ),
      title: Text(
        title,
        style: AppTextStyles.boldTextStyle
            .copyWith(fontSize: 16.sp, height: 0.h, color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
