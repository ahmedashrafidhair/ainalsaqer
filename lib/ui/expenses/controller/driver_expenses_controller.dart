import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../app/translations/lang_keys.dart';
import '../../../data/api/api_constant.dart';
import '../../../data/api/http_service.dart';
import '../../../data/models/driver_expenses/driver_expenses.dart';
import '../../../data/models/driver_expenses/driver_expenses_model.dart';
import '../../base_controller.dart';

class ExpensesController extends BaseController {
  final PagingController<int, DriverExpenses> pagingController =
      PagingController(firstPageKey: 0);
  static const _pageSize = 10;

  @override
  onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getDriverExpenses(pageKey);
    });
  }

  Future<void> getDriverExpenses(int pageKey) async {
    try {
      Map<String, dynamic> body = {
        'pageNumber': pageKey,
        'pageSize': 10,
      };
      final result = await httpService
          .request(
              url: ApiConstant.getDriverExpenses,
              method: Method.GET,
              params: body)
          .catchError((onError) {
        pagingController.error = onError;
      });
      if (result != null) {
        if (result is d.Response) {
          var resp = DriverExpensesModel.fromJson(result.data);
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
}
