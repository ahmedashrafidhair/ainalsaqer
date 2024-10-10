import 'package:ainalsaqer/data/models/order_details/order_details_data.dart';
import 'package:ainalsaqer/data/models/order_details/order_details_model.dart';
import 'package:ainalsaqer/ui/base_controller.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';

import '../../../data/api/api_constant.dart';
import '../../../data/api/http_service.dart';

class OrderDetailsController extends BaseController {
  var docCode = "".obs;
  var orderId = "".obs;
  var screen = 0.obs;
  var isLoading = false.obs;
  var orderDetails = OrderDetailsData();

  @override
  onInit() {
    super.onInit();
    orderId.value = Get.arguments['orderId'];
    docCode.value = Get.arguments['docCode'];
    getById();
  }

  Future<void> getById() async {
    try {
      isLoading(true);
      final result = await httpService.request(
          url: "${ApiConstant.getById}?id=${orderId.value}",
          method: Method.GET);
      if (result != null) {
        if (result is d.Response) {
          var resp = OrderDetailsModel.fromJson(result.data);
          orderDetails = resp.result ?? OrderDetailsData();
          screen.value = 1;
        }
      }
    } finally {
      isLoading(false);
      update(['updateDetails']);
    }
  }
}
