import 'branch.dart';
import 'customer.dart';
import 'history.dart';
import 'vehicle.dart';

class OrderDetailsData {
  String? id;
  String? docCode;
  String? actionByName;
  String? company;
  String? remarks;
  int? serviceType;
  int? department;
  int? dateType;
  int? status;
  String? scheduleDate;
  String? createDate;
  Vehicle? vehicle;
  Customer? fromCustomer;
  Customer? toCustomer;
  Branch? fromBranch;
  Branch? toBranch;
  List<History>? history;

  OrderDetailsData({
    this.id,
    this.docCode,
    this.actionByName,
    this.company,
    this.remarks,
    this.serviceType,
    this.department,
    this.dateType,
    this.status,
    this.scheduleDate,
    this.createDate,
    this.vehicle,
    this.fromCustomer,
    this.toCustomer,
    this.fromBranch,
    this.toBranch,
    this.history,
  });

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) => OrderDetailsData(
        id: json["id"],
        docCode: json["docCode"],
        actionByName: json["actionByName"],
        company: json["company"],
        remarks: json["remarks"],
        serviceType: json["serviceType"],
        department: json["department"],
        dateType: json["dateType"],
        status: json["status"],
        scheduleDate: json["scheduleDate"],
        createDate: json["createDate"],
        vehicle:
            json["vehicle"] != null ? Vehicle.fromJson(json["vehicle"]) : null,
        fromCustomer: json["fromCustomer"] != null
            ? Customer.fromJson(json["fromCustomer"])
            : null,
        toCustomer: json["toCustomer"] != null
            ? Customer.fromJson(json["toCustomer"])
            : null,
        fromBranch: json["fromBranch"] != null
            ? Branch.fromJson(json["fromBranch"])
            : null,
        toBranch:
            json["toBranch"] != null ? Branch.fromJson(json["toBranch"]) : null,
        history: json["history"] != null
            ? List<History>.from(
                json["history"].map((x) => History.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "docCode": docCode,
        "actionByName": actionByName,
        "company": company,
        "remarks": remarks,
        "serviceType": serviceType,
        "department": department,
        "dateType": dateType,
        "status": status,
        "scheduleDate": scheduleDate,
        "createDate": createDate,
        "vehicle": vehicle?.toJson(),
        "fromCustomer": fromCustomer?.toJson(),
        "toCustomer": toCustomer?.toJson(),
        "fromBranch": fromBranch?.toJson(),
        "toBranch": toBranch?.toJson(),
        "history": List<dynamic>.from(history!.map((x) => x.toJson())),
      };
}
