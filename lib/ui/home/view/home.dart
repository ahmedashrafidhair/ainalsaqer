import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/extensions/color.dart';
import '../../../app/util/bottom_sheet.dart';
import '../../../app/util/utils.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.primary,
        // systemNavigationBarColor: Colors.purple,
      ),
    );
    return Scaffold(
      // appBar: CustomHomeAppBar(
      //     title: Text("",
      //         style: AppTextStyles.boldTextStyle
      //             .copyWith(color: Colors.black, fontSize: 16.sp))),
      backgroundColor: AppColors.bgColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: SvgPicture.asset(Utils.getIconPath("ic_add_nav"),
            width: 30.0.w, height: 30.0.h),
      ),
      bottomNavigationBar: Obx(() => SafeArea(
              child: BottomAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const CircularNotchedRectangle(),
            padding: EdgeInsetsDirectional.zero,
            child: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: HexColor("F7F7F7"), primaryColor: Colors.red),
              child: BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                onTap: (index) {
                  print("Log index $index");
                  if (index == 0 || index == 1) {
                    if (controller.storage.isAuth()) {
                      controller.currentIndex(index);
                    } else {
                      confirmBottomSheet();
                    }
                  } else {
                    controller.currentIndex(index);
                    // if (index == 2) {
                    //   controller.currentIndex(3);
                    // } else {
                    //   controller.currentIndex(4);
                    // }
                  }
                },
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
                selectedLabelStyle: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
                selectedItemColor: AppColors.primary,
                unselectedItemColor: HexColor("686868"),
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      label: LangKeys.home.tr,
                      activeIcon: SvgPicture.asset(
                        Utils.getIconPath("ic_home_nav"),
                        width: 24.0.w,
                        height: 24.0.h,
                        colorFilter: ColorFilter.mode(
                            AppColors.primary, BlendMode.srcIn),
                      ),
                      icon: SvgPicture.asset(
                        Utils.getIconPath("ic_home_nav"),
                        width: 24.0.w,
                        height: 24.0.h,
                        colorFilter: ColorFilter.mode(
                            HexColor("686868"), BlendMode.srcIn),
                      )),
                  BottomNavigationBarItem(
                    label: LangKeys.myOrders.tr,
                    activeIcon: SvgPicture.asset(
                      Utils.getIconPath("ic_my_orders_nav"),
                      width: 24.0.w,
                      height: 24.0.h,
                      colorFilter:
                          ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Utils.getIconPath("ic_my_orders_nav"),
                      width: 24.0.w,
                      height: 24.0.h,
                      colorFilter:
                          ColorFilter.mode(HexColor("686868"), BlendMode.srcIn),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: LangKeys.notifications.tr,
                    activeIcon: SvgPicture.asset(
                      Utils.getIconPath("ic_notification_nav"),
                      width: 24.0.w,
                      height: 24.0.h,
                      colorFilter:
                          ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Utils.getIconPath("ic_notification_nav"),
                      width: 24.0.w,
                      height: 24.0.h,
                      colorFilter:
                          ColorFilter.mode(HexColor("484C52"), BlendMode.srcIn),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: LangKeys.settings.tr,
                    activeIcon: SvgPicture.asset(
                      Utils.getIconPath("ic_settings_nav"),
                      width: 24.0.w,
                      height: 24.0.h,
                      colorFilter:
                          ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Utils.getIconPath("ic_settings_nav"),
                      width: 24.0.w,
                      height: 24.0.h,
                      colorFilter:
                          ColorFilter.mode(HexColor("686868"), BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ))),

      body: SafeArea(
          child: Obx(() => controller.screens[controller.currentIndex.value])),
    );
  }
}
