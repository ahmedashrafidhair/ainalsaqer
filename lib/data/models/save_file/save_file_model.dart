import 'package:ainalsaqer/data/models/global_model.dart';

import 'save_file.dart';

class SaveFileModel extends GlobalModel {
  SaveFileModel({this.result});

  SaveFile? result;

  factory SaveFileModel.fromJson(Map<String, dynamic> json) => SaveFileModel(
        result:
            json["result"] != null ? SaveFile.fromJson(json["result"]) : null,
      )
        ..errorCode = json['errorCode']
        ..errorMessage = json['errorMessage'];

  @override
  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
      };
}
