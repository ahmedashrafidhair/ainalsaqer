import 'token_info.dart';

class User {
  String? name;
  String? email;
  String? phoneNumber;
  String? truckNumber;
  String? licenseNo;
  String? ownerName;
  String? ownerPhoneNumber;
  int? acceptedLanguage;
  TokenInfo? tokenInfo;

  User({
    this.name,
    this.email,
    this.phoneNumber,
    this.truckNumber,
    this.licenseNo,
    this.ownerName,
    this.ownerPhoneNumber,
    this.acceptedLanguage,
    this.tokenInfo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        truckNumber: json["truckNumber"],
        licenseNo: json["licenseNo"],
        ownerName: json["ownerName"],
        ownerPhoneNumber: json["ownerPhoneNumber"],
        acceptedLanguage: json["acceptedLanguage"],
        tokenInfo: TokenInfo.fromJson(json["tokenInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "truckNumber": truckNumber,
        "licenseNo": licenseNo,
        "ownerName": ownerName,
        "ownerPhoneNumber": ownerPhoneNumber,
        "acceptedLanguage": acceptedLanguage,
        "tokenInfo": tokenInfo?.toJson(),
      };
}
