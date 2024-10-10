class History {
  String? id;
  String? remarks;
  int? status;
  String? createDate;
  dynamic duration;

  History({
    this.id,
    this.remarks,
    this.status,
    this.createDate,
    this.duration,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        remarks: json["remarks"],
        status: json["status"],
        createDate: json["createDate"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "remarks": remarks,
        "status": status,
        "createDate": createDate,
        "duration": duration,
      };
}
