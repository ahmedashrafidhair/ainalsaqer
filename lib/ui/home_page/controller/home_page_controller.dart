import 'package:dio/dio.dart' as d;
import 'package:get/get_rx/get_rx.dart';

import '../../../data/api/api_constant.dart';
import '../../../data/api/http_service.dart';
import '../../../data/models/home_statistics/home_statistics.dart';
import '../../../data/models/home_statistics/home_statistics_model.dart';
import '../../base_controller.dart';

class HomePageController extends BaseController {
  var isLoadingHomeStatistics = false.obs;
  HomeStatistics? homeStatistics;

  @override
  onInit() {
    super.onInit();
    getHome();
  }

  Future<void> getHome() async {
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
