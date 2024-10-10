import 'package:ainalsaqer/data/models/order/order.dart';
import 'package:ainalsaqer/data/models/order/order_model.dart';
import 'package:ainalsaqer/ui/base_controller.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../app/translations/lang_keys.dart';
import '../../../data/api/api_constant.dart';
import '../../../data/api/http_service.dart';

class MyOrdersController extends BaseController {
  final PagingController<int, Order> pagingController =
      PagingController(firstPageKey: 0);
  static const _pageSize = 10;
  final search = TextEditingController();

  var filterStatus = 3.obs;
  DateTime? fromDate;
  DateTime? toDate;
  var fromDateStr = "".obs;
  var toDateStr = "".obs;

  @override
  onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getMyOrders(pageKey);
    });
  }

  Future<void> getMyOrders(int pageKey) async {
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
    try {
      Map<String, dynamic> body = {
        'pageNumber': pageKey,
        'pageSize': 10,
      };
      if (filterStatus.value != 3) {
        body["status"] = filterStatus.value;
      }if (search.text.isNotEmpty ) {
        body["searchQuery"] = search.text;
      }
      if (fromDateStr.value.isNotEmpty && toDateStr.value.isNotEmpty) {
        body["from"] = "${fromDateStr.value}T00:00:00";
        body["to"] = "${toDateStr.value}T00:00:00";
      }
      final result = await httpService
          .request(
              url: ApiConstant.getMyOrders, method: Method.GET, params: body)
          .catchError((onError) {
        pagingController.error = onError;
      });
      if (result != null) {
        if (result is d.Response) {
          var resp = OrderModel.fromJson(result.data);
          final list = resp.result!.data!;
          final isLastPage = list.length < _pageSize;
          if (isLastPage) {
            pagingController.appendLastPage(list);
          } else {
            final nextPageKey = pageKey + 1;
            pagingController.appendPage(list, nextPageKey);
          }
        } else {
          pagingController.error = LangKeys.anErrorFetchingData.tr;
        }
      } else {
        pagingController.error = LangKeys.anErrorFetchingData.tr;
      }
    } finally {
      // pagingController.error = LangKeys.anErrorFetchingData.tr;
    }
  }

  String getTextFromFilterStatus() {
    String str = LangKeys.allOrders.tr;
    switch (filterStatus.value) {
      case 0:
        str = LangKeys.currentOrders.tr;
        break;
      case 1:
        str = LangKeys.expiredOrders.tr;
        break;
      case 2:
        str = LangKeys.cancelledOrders.tr;
        break;
    }
    return str;
  }
}
