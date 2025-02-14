import 'dart:convert';
import 'package:absensi_app/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final urlToken = 'http://192.168.1.112:8000/token';

Future<bool> loginUser(Login loginData) async {
  final response = await http.post(
    Uri.parse(urlToken),
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
    body: {
      "username": loginData.username,
      "password": loginData.password,
    },
  );
  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    final String? token = data['access_token'];
    if (token == null) {
      return false;
    }

    //Simpan Token
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    return true;
  } else {
    return false;
  }
}
