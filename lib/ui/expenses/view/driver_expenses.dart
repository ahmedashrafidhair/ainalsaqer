import 'package:ainalsaqer/app/config/app_colors.dart';
import 'package:ainalsaqer/ui/expenses/controller/driver_expenses_controller.dart';
import 'package:ainalsaqer/ui/expenses/view/widget/item_driver_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../app/components/custom_app_bar.dart';
import '../../../app/components/empty_status_view.dart';
import '../../../app/components/loading_view.dart';
import '../../../app/translations/lang_keys.dart';
import '../../../data/models/driver_expenses/driver_expenses.dart';
import '../../shimmer_list.dart';

class Expenses extends StatelessWidget {
  Expenses({super.key});

  ExpensesController controller = Get.put(ExpensesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
          centerTitle: false, isShowBack: true, title: LangKeys.expenses.tr),
      body: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 16.w, end: 16.w, top: 16.h, bottom: 25.h),
          child: RefreshIndicator(
              onRefresh: () async {
                controller.pagingController.refresh();
              },
              child: PagedListView<int, DriverExpenses>(
                pagingController: controller.pagingController,
                shrinkWrap: true,
                primary: true,
                builderDelegate: PagedChildBuilderDelegate<DriverExpenses>(
                    itemBuilder: (context, item, index) {
                      return ItemDriverExpenses(
                        data: item,
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
                    newPageErrorIndicatorBuilder: (_) =>
                        EmptyStatusView(msg: controller.pagingController.error),
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
              ))),
    );
  }
}
