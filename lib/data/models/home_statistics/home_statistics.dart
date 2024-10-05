class HomeStatistics {
  int? todayOrders;
  int? scheduleOrders;
  int? expenses;

  HomeStatistics({
    this.todayOrders,
    this.scheduleOrders,
    this.expenses,
  });

  factory HomeStatistics.fromJson(Map<String, dynamic> json) => HomeStatistics(
    todayOrders: json["todayOrders"],
    scheduleOrders: json["scheduleOrders"],
    expenses: json["expenses"],
  );

  Map<String, dynamic> toJson() => {
    "todayOrders": todayOrders,
    "scheduleOrders": scheduleOrders,
    "expenses": expenses,
  };
}