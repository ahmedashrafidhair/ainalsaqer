class Branch {
  String? id;
  String? company;
  String? branch;
  String? branchPhoneNumber;
  String? emirate;
  String? region;
  String? address;
  String? addressUrl;

  Branch({
    this.id,
    this.company,
    this.branch,
    this.branchPhoneNumber,
    this.emirate,
    this.region,
    this.address,
    this.addressUrl,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    company: json["company"],
    branch: json["branch"],
    branchPhoneNumber: json["branchPhoneNumber"],
    emirate: json["emirate"],
    region: json["region"],
    address: json["address"],
    addressUrl: json["addressUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "branch": branch,
    "branchPhoneNumber": branchPhoneNumber,
    "emirate": emirate,
    "region": region,
    "address": address,
    "addressUrl": addressUrl,
  };
}