class DataRek {
  final String rek;
  final String name;

  DataRek({
    required this.rek,
    required this.name,
  });

  factory DataRek.fromJson(Map<String, dynamic> json) {
    return DataRek(
      rek: json['rek'].toString(),
      name: json['name'].toString(),
    );
  }
}
