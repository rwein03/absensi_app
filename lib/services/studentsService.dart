// ignore_for_file: file_names

import 'dart:convert';
import 'package:absensi_app/models/studentsModel.dart';
import 'package:http/http.dart' as http;
// import 'package:logger/web.dart';
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
    // Logger().i(response.body);
    return jsonData.map((e) => Students.fromJson(e)).toList();
  } else {
    throw Exception("Failed to load students");
  }
}
