class Classes {
  int? class_id;
  String? className;
  String? grade;
  String? section;
  int? user_id;

  Classes({
    required this.class_id,
    required this.className,
    required this.grade,
    required this.section,
    required this.user_id,
  });

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
        class_id: json["class_id"],
        className: json["class_name"],
        grade: json["grade"],
        section: json["section"],
        user_id: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "class_id": class_id,
        "class_name": className,
        "grade": grade,
        "section": section,
        "user_id": user_id,
      };
}
