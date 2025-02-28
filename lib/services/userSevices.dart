import 'dart:convert';

import 'package:absensi_app/models/users.dart';
import 'package:absensi_app/services/auth.dart';
import 'package:http/http.dart' as http;

Future<List<Users>> getUsers() async {
  final token = await Auth().getToken();
  final response = await http.get(
    Uri.parse(Auth().api).replace(path: '/user'),
    headers: {
      "accept": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData
        .map(
          (e) => Users.fromJson(e),
        )
        .toList();
  } else {
    throw Exception("Failed to load users");
  }
}
