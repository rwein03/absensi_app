// ignore_for_file: file_names

class Students {
  int student_id;
  String firstName;
  String lastName;
  String grade;
  String section;
  DateTime dateOfBirth;
  String parentContact;
  String status;
  List<Attendance> attendances;

  Students({
    required this.student_id,
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
        student_id: json['student_id'],
        firstName: json["first_name"],
        lastName: json["last_name"],
        grade: json["grade"],
        section: json["section"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        parentContact: json["parent_contact"],
        status: json["status"],
        attendances: List<Attendance>.from(
            json["attendances"].map((x) => Attendance.fromJson(x))),
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
        "attendances": List<dynamic>.from(attendances.map((x) => x.toJson())),
      };
}

class Attendance {
  int student_id;
  DateTime date;
  String status;
  dynamic reason;
  String? supportingDocument;

  Attendance({
    required this.student_id,
    required this.date,
    required this.status,
    required this.reason,
    this.supportingDocument,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        student_id: json["student_id"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        reason: json["reason"],
        supportingDocument: json["supporting_document"],
      );

  Map<String, dynamic> toJson() => {
        'student_id': student_id,
        'date': date.toIso8601String().split('T')[0],
        'status': status,
        'reason': reason,
        'supporting_document': supportingDocument,
      };
}
