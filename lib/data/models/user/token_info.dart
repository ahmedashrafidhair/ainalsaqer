class TokenInfo {
  String? token;
  String? expiryDate;

  TokenInfo({
    this.token,
    this.expiryDate,
  });

  factory TokenInfo.fromJson(Map<String, dynamic> json) => TokenInfo(
        token: json["token"],
        expiryDate: json["expiryDate"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiryDate": expiryDate,
      };
}
