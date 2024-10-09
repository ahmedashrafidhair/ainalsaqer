import 'order.dart';

class OrderData {
  int? pageNumber;
  int? totalPages;
  int? totalDataCount;
  List<Order>? data;

  OrderData({
    this.pageNumber,
    this.totalPages,
    this.totalDataCount,
    this.data,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        pageNumber: json["pageNumber"],
        totalPages: json["totalPages"],
        totalDataCount: json["totalDataCount"],
        data: json["data"] != null
            ? List<Order>.from(json["data"].map((x) => Order.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "totalPages": totalPages,
        "totalDataCount": totalDataCount,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
