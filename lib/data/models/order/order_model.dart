import 'package:ainalsaqer/data/models/global_model.dart';
import 'package:ainalsaqer/data/models/order/order_data.dart';

import '../user/user.dart';

class OrderModel extends GlobalModel {
  OrderModel({this.result});

  OrderData? result;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        result: json["result"] != null ? OrderData.fromJson(json["result"]) : null,
      )
        ..errorCode = json['errorCode']
        ..errorMessage = json['errorMessage'];

  @override
  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}
