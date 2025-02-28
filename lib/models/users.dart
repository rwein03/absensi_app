class Users {
  String firstName;
  String lastName;
  String contact;
  String username;
  String email;
  String password;
  String role;

  Users({
    required this.firstName,
    required this.lastName,
    required this.contact,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        firstName: json["first_name"],
        lastName: json["last_name"],
        contact: json["contact"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "contact": contact,
        "username": username,
        "email": email,
        "password": password,
        "role": role,
      };
}
