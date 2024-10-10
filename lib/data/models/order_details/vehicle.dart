class Vehicle {
  String? id;
  String? number;
  String? platNumber;
  String? vehicleType;
  String? vehicleCategory;
  bool? unRegistedCar;

  Vehicle({
    this.id,
    this.number,
    this.platNumber,
    this.vehicleType,
    this.vehicleCategory,
    this.unRegistedCar,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    number: json["number"],
    platNumber: json["platNumber"],
    vehicleType: json["vehicleType"],
    vehicleCategory: json["vehicleCategory"],
    unRegistedCar: json["unRegistedCar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "platNumber": platNumber,
    "vehicleType": vehicleType,
    "vehicleCategory": vehicleCategory,
    "unRegistedCar": unRegistedCar,
  };
}