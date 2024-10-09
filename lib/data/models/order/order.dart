class Order {
  String? id;
  String? docCode;
  String? createDate;
  String? scheduleDate;
  int? dateType;
  int? status;
  int? serviceType;
  String? company;
  String? from;
  String? to;

  Order({
    this.id,
    this.docCode,
    this.createDate,
    this.scheduleDate,
    this.dateType,
    this.status,
    this.serviceType,
    this.company,
    this.from,
    this.to,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        docCode: json["docCode"],
        createDate: json["createDate"],
        scheduleDate: json["scheduleDate"],
        dateType: json["dateType"],
        status: json["status"],
        serviceType: json["serviceType"],
        company: json["company"],
        from: json["from"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "docCode": docCode,
        "createDate": createDate,
        "scheduleDate": scheduleDate,
        "dateType": dateType,
        "status": status,
        "serviceType": serviceType,
        "company": company,
        "from": from,
        "to": to,
      };
}
