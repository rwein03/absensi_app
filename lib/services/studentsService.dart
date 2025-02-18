import 'dart:convert';
import 'package:absensi_app/models/studentsModel.dart';
import 'package:http/http.dart' as http;
import 'package:logger/web.dart';
import 'auth.dart';

final urlString = "http://10.10.104.102:8000/students";

Future<List<Students>> getsStudents() async {
  final token = await Auth().getToken();
  Logger().i(token);

  final response = await http.get(
    Uri.parse(urlString),
    headers: {
      "accept": "application/json",
      "Authorization": "Bearer $token",
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((e) => Students.fromJson(e)).toList();
  } else {
    throw Exception("Failed to load students");
  }
}
