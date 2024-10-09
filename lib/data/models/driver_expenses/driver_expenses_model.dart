import 'package:ainalsaqer/data/models/global_model.dart';

import 'driver_expenses_data.dart';

class DriverExpensesModel extends GlobalModel {
  DriverExpensesModel({this.result});

  DriverExpensesData? result;

  factory DriverExpensesModel.fromJson(Map<String, dynamic> json) =>
      DriverExpensesModel(
        result: json["result"] != null
            ? DriverExpensesData.fromJson(json["result"])
            : null,
      )
        ..errorCode = json['errorCode']
        ..errorMessage = json['errorMessage'];

  @override
  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}
