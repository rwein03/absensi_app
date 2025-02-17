class Students {
  String firstName;
  String lastName;
  String grade;
  String section;
  DateTime dateOfBirth;
  String parentContact;
  String status;
  List<dynamic> attendances;

  Students({
    required this.firstName,
    required this.lastName,
    required this.grade,
    required this.section,
    required this.dateOfBirth,
    required this.parentContact,
    required this.status,
    required this.attendances,
  });

  factory Students.fromJson(Map<String, dynamic> json) => Students(
        firstName: json["first_name"],
        lastName: json["last_name"],
        grade: json["grade"],
        section: json["section"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        parentContact: json["parent_contact"],
        status: json["status"],
        attendances: List<dynamic>.from(json["attendances"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "grade": grade,
        "section": section,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "parent_contact": parentContact,
        "status": status,
        "attendances": List<dynamic>.from(attendances.map((x) => x)),
      };
}
