import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../app/translations/lang_keys.dart';
import '../../../data/api/api_constant.dart';
import '../../../data/api/http_service.dart';
import '../../../data/models/home_statistics/home_statistics.dart';
import '../../../data/models/home_statistics/home_statistics_model.dart';
import '../../../data/models/order/order.dart';
import '../../../data/models/order/order_model.dart';
import '../../base_controller.dart';

class HomePageController extends BaseController {
  var isLoadingHomeStatistics = false.obs;
  HomeStatistics? homeStatistics;
  final PagingController<int, Order> pagingController =
      PagingController(firstPageKey: 0);
  static const _pageSize = 10;

  @override
  onInit() {
    super.onInit();
    getHomePageStatistics();
    pagingController.addPageRequestListener((pageKey) {
      getUnBookedOrders(pageKey);
    });
  }

  Future<void> getUnBookedOrders(int pageKey) async {
    try {
      Map<String, dynamic> body = {
        'pageNumber': pageKey,
        'pageSize': 10,
      };

      final result = await httpService
          .request(
              url: ApiConstant.getUnBookedOrders,
              method: Method.GET,
              params: body)
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

  Future<void> getHomePageStatistics() async {
    try {
      isLoadingHomeStatistics(true);
      final result = await httpService.request(
        url: ApiConstant.getHomePageStatistics,
        method: Method.GET,
      );
      if (result != null) {
        if (result is d.Response) {
          var resp = HomeStatisticsModel.fromJson(result.data);
          if (resp.result != null) {
            homeStatistics = resp.result;
          }
        }
      }
    } finally {
      isLoadingHomeStatistics(false);
      update(['homeStatistics']);
    }
  }
}
