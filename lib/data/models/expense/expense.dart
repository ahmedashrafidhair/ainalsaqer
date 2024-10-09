class Expense {
  String? id;
  String? name;
  String? docCode;

  Expense({
    this.id,
    this.name,
    this.docCode,
  });

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
        id: json["id"],
        name: json["name"],
        docCode: json["docCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "docCode": docCode,
      };
}
