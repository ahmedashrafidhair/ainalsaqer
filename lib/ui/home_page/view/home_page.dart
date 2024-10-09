import 'package:ainalsaqer/app/components/custom_home_app_bar.dart';
import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/components/loading_view.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/routes/app_routes.dart';
import 'package:ainalsaqer/app/translations/lang_keys.dart';
import 'package:ainalsaqer/app/util/utils.dart';
import 'package:ainalsaqer/ui/home_page/controller/home_page_controller.dart';
import 'package:ainalsaqer/ui/home_page/view/widget/item_today_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../app/components/empty_status_view.dart';
import '../../../data/models/order/order.dart';
import '../../shimmer_list.dart';

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
                                text:
                                    "${LangKeys.today.tr} ( ${controller.homeStatistics?.todayOrders ?? 0} )",
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
                                text:
                                    "${LangKeys.scheduleOrders.tr} ( ${controller.homeStatistics?.scheduleOrders ?? 0} )",
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
                            child: InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.driverExpenses);
                          },
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
                                  text:
                                      "${LangKeys.expenses.tr} ( ${controller.homeStatistics?.expenses ?? 0} )",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  maxLines: 1,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        )),
                      ],
                    )
                  ],
                );
              },
            ),
            Expanded(
                child: Column(
              children: [
                27.verticalSpace,
                Row(
                  children: [
                    Expanded(
                        child: CustomText(
                            text:
                                "${LangKeys.todaysOrders.tr} ( ${Utils.getCurrentFormattedDate()} )",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Container(
                      padding: EdgeInsetsDirectional.only(
                          start: 7.w, end: 7.w, top: 6.h, bottom: 6.h),
                      decoration: ShapeDecoration(
                        color: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: SvgPicture.asset(Utils.getIconPath("ic_filter"),
                          width: 24.0.w, height: 24.0.h),
                    )
                  ],
                ),
                27.verticalSpace,
                Expanded(
                    child: GetBuilder<HomePageController>(
                        id: 'updateList',
                        builder: (controller) {
                          return Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 0.w, end: 0.w, top: 0.h, bottom: 25.h),
                              child: RefreshIndicator(
                                  onRefresh: () async {
                                    controller.pagingController.refresh();
                                  },
                                  child: PagedListView<int, Order>(
                                    pagingController:
                                        controller.pagingController,
                                    shrinkWrap: true,
                                    primary: true,
                                    builderDelegate: PagedChildBuilderDelegate<
                                            Order>(
                                        itemBuilder: (context, item, index) {
                                          return ItemTodayOrder(
                                            order: item,
                                            // onTap: () {
                                            //   Get.toNamed(AppRoutes.orderDetails,
                                            //       arguments: {"orderId": item.id});
                                            // },
                                          );
                                        },
                                        firstPageErrorIndicatorBuilder: (_) {
                                          return EmptyStatusView(
                                            msg: controller
                                                .pagingController.error,
                                          );
                                        },
                                        noItemsFoundIndicatorBuilder: (_) =>
                                            EmptyStatusView(
                                              msg: LangKeys.noData.tr,
                                            ),
                                        newPageErrorIndicatorBuilder: (_) =>
                                            EmptyStatusView(
                                                msg: controller
                                                    .pagingController.error),
                                        firstPageProgressIndicatorBuilder:
                                            (_) => SizedBox(
                                                width: ScreenUtil().screenWidth,
                                                height:
                                                    ScreenUtil().screenHeight,
                                                child: ShimmerList()),
                                        newPageProgressIndicatorBuilder: (_) =>
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    width: 50.0.w,
                                                    height: 50.0.h,
                                                    child: const LoadingView()),
                                              ],
                                            )),
                                  )));
                        }))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
