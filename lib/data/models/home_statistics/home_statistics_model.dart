import 'package:ainalsaqer/data/models/global_model.dart';

import 'home_statistics.dart';

class HomeStatisticsModel extends GlobalModel {
  HomeStatisticsModel({this.result});

  HomeStatistics? result;

  factory HomeStatisticsModel.fromJson(Map<String, dynamic> json) =>
      HomeStatisticsModel(
        result: json["result"] != null
            ? HomeStatistics.fromJson(json["result"])
            : null,
      )
        ..errorCode = json['errorCode']
        ..errorMessage = json['errorMessage'];

  @override
  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}
