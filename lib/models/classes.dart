class Class {
  String className;
  String grade;
  String section;
  int user_id;

  Class({
    required this.className,
    required this.grade,
    required this.section,
    required this.user_id,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        className: json["class_name"],
        grade: json["grade"],
        section: json["section"],
        user_id: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "class_name": className,
        "grade": grade,
        "section": section,
        "user_id": user_id,
      };
}
