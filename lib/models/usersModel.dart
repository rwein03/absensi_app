class Users {
  int? user_id;
  String? firstName;
  String? lastName;
  String? contact;
  String? username;
  String? email;
  String? password;
  String? role;

  Users({
    required this.user_id,
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        user_id: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        contact: json["contact"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "first_name": firstName,
        "last_name": lastName,
        "contact": contact,
        "username": username,
        "email": email,
        "password": password,
        "role": role,
      };
}
