import 'package:ainalsaqer/app/components/custom_text.dart';
import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/app/extensions/color.dart';
import 'package:ainalsaqer/data/models/order/order.dart';
import 'package:ainalsaqer/ui/my_orders/controller/my_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

import '../../../app/components/custom_app_bar.dart';
import '../../../app/components/empty_status_view.dart';
import '../../../app/components/loading_view.dart';
import '../../../app/translations/lang_keys.dart';
import '../../../app/util/common_style.dart';
import '../../../app/util/utils.dart';
import '../../shimmer_list.dart';
import 'widget/filter_chip_widget.dart';
import 'widget/item_my_order.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});

  MyOrdersController controller = Get.put(MyOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: LangKeys.myOrders.tr),
      body: Padding(
        padding: EdgeInsetsDirectional.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                // controller: controller.dateRange,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: CommonStyle.textFieldSearchStyle(
                        hintTextStr: LangKeys.searchHere.tr)
                    .copyWith(
                        prefixIcon: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: SvgPicture.asset(Utils.getIconPath("ic_search")),
                ))),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: FilterButton(
                      title: controller.fromDateStr.value.isNotEmpty
                          ? controller.fromDateStr.value
                          : LangKeys.fromDate.tr,
                      icon: "ic_calendar",
                      onTap: () {
                        showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                    primary: Colors.black,
                                    primaryContainer: Colors.red,
                                    // header background color
                                    onPrimary: Colors.white,
                                    onPrimaryContainer: Colors.black,
                                    // header text color
                                    onSurfaceVariant: Colors.black,
                                    onSurface: Colors.black,
                                    // body text color
                                    onTertiary: Colors.black),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        Colors.red, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          cancelText: LangKeys.cancel.tr,
                          confirmText: LangKeys.ok.tr,
                          helpText: LangKeys.selectedDate.tr,
                          initialDate: controller.fromDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((pickedDate) {
                          if (pickedDate != null) {
                            controller.fromDate = pickedDate;
                            controller.fromDateStr(DateFormat('yyyy-MM-dd')
                                .format(controller.fromDate!));
                            if (controller.fromDateStr.value.isNotEmpty &&
                                controller.toDateStr.value.isNotEmpty) {
                              controller.pagingController.refresh();
                            }
                          }
                        });
                      },
                    ),
                  ),
                  12.horizontalSpace,
                  CustomText(
                    text: LangKeys.to.tr,
                    maxLines: 1,
                    fontSize: 12.sp,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: FilterButton(
                      title: controller.toDateStr.value.isNotEmpty
                          ? controller.toDateStr.value
                          : LangKeys.date.tr,
                      icon: "ic_calendar",
                      onTap: () {
                        DateTime firstAllowedDate = controller.fromDate ??
                            DateTime(
                                2000); // Default to 2000 if no "fromDate" is set
                        DateTime initialDate = controller.toDate ??
                            controller.fromDate ??
                            DateTime
                                .now(); // Use "toDate" or "fromDate" or current date

                        // If the initial date is before the first allowed date, set initial date to first allowed date
                        if (initialDate.isBefore(firstAllowedDate)) {
                          initialDate = firstAllowedDate;
                        }
                        showDatePicker(
                          context: context,
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                    primary: Colors.black,
                                    primaryContainer: Colors.red,
                                    // header background color
                                    onPrimary: Colors.white,
                                    onPrimaryContainer: Colors.black,
                                    // header text color
                                    onSurfaceVariant: Colors.black,
                                    onSurface: Colors.black,
                                    // body text color
                                    onTertiary: Colors.black),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor:
                                        Colors.red, // button text color
                                  ),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          cancelText: LangKeys.cancel.tr,
                          confirmText: LangKeys.ok.tr,
                          helpText: LangKeys.selectedDate.tr,
                          initialDate: initialDate,
                          // Set a valid initial date
                          firstDate: firstAllowedDate,
                          // "To Date" should not be before "From Date"
                          lastDate: DateTime(2100),
                        ).then((pickedDate) {
                          if (pickedDate != null) {
                            controller.toDate = pickedDate;
                            controller.toDateStr(DateFormat('yyyy-MM-dd')
                                .format(controller.toDate!));
                            if (controller.fromDateStr.value.isNotEmpty &&
                                controller.toDateStr.value.isNotEmpty) {
                              controller.pagingController.refresh();
                            }
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Row(
                children: [
                  Expanded(
                      child: FilterChipWidget(
                    label: LangKeys.currentOrders.tr,
                    isActive: controller.filterStatus.value == 0,
                    onSelected: (selected) {
                      controller.filterStatus(0);
                      controller.pagingController.refresh();
                    },
                  )),
                  Expanded(
                      child: FilterChipWidget(
                    label: LangKeys.expiredOrders.tr,
                    isActive: controller.filterStatus.value == 1,
                    onSelected: (selected) {
                      controller.filterStatus(1);
                      controller.pagingController.refresh();
                    },
                  )),
                  Expanded(
                      child: FilterChipWidget(
                    label: LangKeys.cancelledOrders.tr,
                    isActive: controller.filterStatus.value == 2,
                    onSelected: (selected) {
                      controller.filterStatus(2);
                      controller.pagingController.refresh();
                    },
                  )),
                ],
              ),
            ),
            8.verticalSpace,
            Obx(
              () => CustomText(
                text: controller.getTextFromFilterStatus(),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            12.verticalSpace,
            Expanded(
                child: RefreshIndicator(
                    onRefresh: () async {
                      controller.fromDate = null;
                      controller.toDate = null;
                      controller.fromDateStr("");
                      controller.toDateStr("");
                      controller.filterStatus(3);
                      controller.pagingController.refresh();
                    },
                    child: PagedListView<int, Order>(
                      pagingController: controller.pagingController,
                      shrinkWrap: true,
                      primary: true,
                      builderDelegate: PagedChildBuilderDelegate<Order>(
                          itemBuilder: (context, item, index) {
                            return ItemMyOrder(
                              order: item,
                              // onTap: () {
                              //   Get.toNamed(AppRoutes.orderDetails,
                              //       arguments: {"orderId": item.id});
                              // },
                            );
                          },
                          firstPageErrorIndicatorBuilder: (_) {
                            return EmptyStatusView(
                              msg: controller.pagingController.error,
                            );
                          },
                          noItemsFoundIndicatorBuilder: (_) => EmptyStatusView(
                                msg: LangKeys.noData.tr,
                              ),
                          newPageErrorIndicatorBuilder: (_) => EmptyStatusView(
                              msg: controller.pagingController.error),
                          firstPageProgressIndicatorBuilder: (_) => SizedBox(
                              width: ScreenUtil().screenWidth,
                              height: ScreenUtil().screenHeight,
                              child: ShimmerList()),
                          newPageProgressIndicatorBuilder: (_) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 50.0.w,
                                      height: 50.0.h,
                                      child: const LoadingView()),
                                ],
                              )),
                    )))
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const FilterButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsetsDirectional.only(
              start: 8.w, end: 8.w, top: 8.5.h, bottom: 8.5.h),
          margin: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: HexColor("4F8AFF"), width: 0.3.w),
          ),
          child: Row(
            children: [
              Expanded(
                  child: CustomText(
                text: title,
                maxLines: 1,
                textAlign: TextAlign.center,
                fontSize: 12.sp,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                color: HexColor("B8B8B8"),
              )),
              5.horizontalSpace,
              SvgPicture.asset(Utils.getIconPath(icon),
                  width: 24.w, height: 24.h),
            ],
          ),
        ));
  }
}
