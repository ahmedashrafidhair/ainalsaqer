class Customer {
  String? id;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? phoneNumber2;
  String? emirate;
  String? region;
  dynamic address;
  dynamic addressUrl;

  Customer({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.phoneNumber2,
    this.emirate,
    this.region,
    this.address,
    this.addressUrl,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        phoneNumber2: json["phoneNumber2"],
        emirate: json["emirate"],
        region: json["region"],
        address: json["address"],
        addressUrl: json["addressUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "phoneNumber2": phoneNumber2,
        "emirate": emirate,
        "region": region,
        "address": address,
        "addressUrl": addressUrl,
      };
}
