import 'package:ainalsaqer/app/components/custom_home_app_bar.dart';
import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/components/loading_view.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:ainalsaqer/app/util/utils.dart';
import 'package:ainalsaqer/ui/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppBar(title: ""),
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
        child: Column(
          children: [
            GetBuilder<HomePageController>(
              id: "homeStatistics",
              builder: (controller) {
                if (controller.isLoadingHomeStatistics.isTrue) {
                  return const Center(child: LoadingView());
                }
                if (controller.homeStatistics == null) {
                  return const SizedBox();
                }
                return Column(
                  children: [
                    40.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 17.h),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.10.w, color: Colors.black),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 2,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Utils.getIconPath("ic_today_orders"),
                                width: 24.w,
                                height: 24.h,
                              ),
                              15.verticalSpace,
                              CustomText(
                                text: "${LangKeys.todaysOrders.tr} ( ${controller.homeStatistics?.todayOrders ?? 0} )",
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                maxLines: 1,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )),
                        12.horizontalSpace,
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 17.h),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.10.w, color: Colors.black),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 2,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Utils.getIconPath("ic_schedule_orders"),
                                width: 24.w,
                                height: 24.h,
                              ),
                              15.verticalSpace,
                              CustomText(
                                text: "${LangKeys.scheduleOrders.tr} ( ${controller.homeStatistics?.scheduleOrders ?? 0} )",
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                maxLines: 1,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )),
                        12.horizontalSpace,
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 17.h),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.10.w, color: Colors.black),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 2,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Utils.getIconPath("ic_expenses"),
                                width: 24.w,
                                height: 24.h,
                              ),
                              15.verticalSpace,
                              CustomText(
                                text: "${LangKeys.expenses.tr} ( ${controller.homeStatistics?.expenses ?? 0} )",
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                maxLines: 1,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )),
                      ],
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
