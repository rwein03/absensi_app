// ignore_for_file: file_names
import 'dart:convert';
import 'package:absensi_app/models/studentsModel.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'auth.dart';

Future<List<Students>> getsStudents() async {
  final token = await Auth().getToken();
  final response = await http.get(
    Uri.parse(Auth().api).replace(path: '/students'),
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

Future<bool> insertStudent(Students students) async {
  final token = await Auth().getToken();
  final response = await http.post(
    Uri.parse('${Auth().api}/student/create/'),
    headers: {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(students.toJson()),
  );
  if (response.statusCode == 201) {
    return true;
  } else {
    Logger().i(response.body);
    return false;
  }
}
