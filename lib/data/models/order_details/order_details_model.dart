import 'package:ainalsaqer/data/models/global_model.dart';

import 'order_details_data.dart';

class OrderDetailsModel extends GlobalModel {
  OrderDetailsModel({this.result});

  OrderDetailsData? result;

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        result: json["result"] != null
            ? OrderDetailsData.fromJson(json["result"])
            : null,
      )
        ..errorCode = json['errorCode']
        ..errorMessage = json['errorMessage'];

  @override
  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}
