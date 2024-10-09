import 'driver_expenses.dart';

class DriverExpensesData {
  int? pageNumber;
  int? totalPages;
  int? totalDataCount;
  List<DriverExpenses>? data;

  DriverExpensesData({
    this.pageNumber,
    this.totalPages,
    this.totalDataCount,
    this.data,
  });

  factory DriverExpensesData.fromJson(Map<String, dynamic> json) =>
      DriverExpensesData(
        pageNumber: json["pageNumber"],
        totalPages: json["totalPages"],
        totalDataCount: json["totalDataCount"],
        data: json["data"] != null
            ? List<DriverExpenses>.from(
                json["data"].map((x) => DriverExpenses.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "totalPages": totalPages,
        "totalDataCount": totalDataCount,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
