class GlobalModel {
  int? errorCode;
  String? errorMessage;

  GlobalModel({
    this.errorCode,
    this.errorMessage,
  });

  factory GlobalModel.fromJson(Map<String, dynamic> json) => GlobalModel(
        errorCode: json["errorCode"],
        errorMessage: json["errorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorMessage": errorMessage,
        // "errors": errors?.toJson(),
      };
}
