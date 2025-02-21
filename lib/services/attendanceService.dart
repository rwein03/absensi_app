import 'dart:convert';

import 'package:absensi_app/models/studentsModel.dart';
import 'package:absensi_app/services/auth.dart';
import 'package:http/http.dart' as http;

Future<bool> postAttendance(Attendance attendance) async {
  final token = await Auth().getToken();
  final response = await http.post(
    Uri.parse('${Auth().api}/attendance/create/'),
    headers: {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(attendance.toJson()),
  );
  if (response.statusCode == 201) {
    return true;
  } else {
    return false;
  }
}
