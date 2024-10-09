class DriverExpenses {
  String? id;
  String? docCode;
  String? name;
  String? billNumber;
  dynamic price;
  bool? approved;

  DriverExpenses({
    this.id,
    this.docCode,
    this.name,
    this.billNumber,
    this.price,
    this.approved,
  });

  factory DriverExpenses.fromJson(Map<String, dynamic> json) => DriverExpenses(
        id: json["id"],
        docCode: json["docCode"],
        name: json["name"],
        billNumber: json["billNumber"],
        price: json["price"],
        approved: json["approved"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "docCode": docCode,
        "name": name,
        "billNumber": billNumber,
        "price": price,
        "approved": approved,
      };
}
