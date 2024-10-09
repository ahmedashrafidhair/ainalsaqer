import 'package:ainalsaqer/data/models/global_model.dart';

import 'expense.dart';

class ExpenseModel extends GlobalModel {
  List<Expense>? result;

  ExpenseModel({
    this.result,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        result: json["result"] != null
            ? List<Expense>.from(json["result"].map((x) => Expense.fromJson(x)))
            : [],
      )
        ..errorCode = json['errorCode']
        ..errorMessage = json['errorMessage'];

  @override
  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}
