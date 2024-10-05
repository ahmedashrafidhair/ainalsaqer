import '../global_model.dart';
import 'user.dart';

class UserModel extends GlobalModel {
  UserModel({this.result});

  User? result;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        result: json["result"] != null ? User.fromJson(json["result"]) : null,
      )
        ..errorCode = json['errorCode']
        ..errorMessage = json['errorMessage'];

  @override
  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}
