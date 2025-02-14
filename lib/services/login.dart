import 'dart:convert';
import 'package:absensi_app/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final urlToken = 'http://127.0.0.1:8000/token';

Future<bool> loginUser(Login loginData) async {
  final response = await http.post(
    Uri.parse("http://10.10.104.102:8000/token"), // Adjust based on your server
    headers: {
      "Content-Type": "application/json",
      "Access-Control_Allow_Origin": "*"
    },
    body: jsonEncode(loginData.toJson()), // Convert model to JSON
  );

  if (response.statusCode == 202) {
    final data = jsonDecode(response.body);
    final token = data['acess_token'];

    //Simpan Token
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    return true;
  } else {
    return false;
  }
}
