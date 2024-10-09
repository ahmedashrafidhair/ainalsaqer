class SaveFile {
  String? id;
  String? url;
  String? name;
  int? fileType;
  int? fileKind;

  SaveFile({
    this.id,
    this.url,
    this.name,
    this.fileType,
    this.fileKind,
  });

  factory SaveFile.fromJson(Map<String, dynamic> json) => SaveFile(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        fileType: json["fileType"],
        fileKind: json["fileKind"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "fileType": fileType,
        "fileKind": fileKind,
      };
}
