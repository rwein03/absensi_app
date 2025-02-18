class CalenderAdd {
  final String name;
  final String status;

  CalenderAdd({
    required this.name,
    required this.status,
  });

  factory CalenderAdd.fromJson(Map<String, dynamic> json) => CalenderAdd(
        name: json['name'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
      };
}
