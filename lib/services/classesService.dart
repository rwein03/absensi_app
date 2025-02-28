import 'dart:convert';
import 'package:absensi_app/models/classes.dart';
import 'package:absensi_app/services/auth.dart';
import 'package:http/http.dart' as http;

class APIclasses {
  Future<List<Classes>> getClasses() async {
    final token = await Auth().getToken();
    final response = await http.get(
      Uri.parse(Auth().api).replace(path: '/classes/'),
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData
          .map(
            (e) => Classes.fromJson(e),
          )
          .toList();
    } else {
      throw Exception("Failed to load Classes");
    }
  }

  Future<bool> insertData(Classes classes) async {
    final token = await Auth().getToken();
    final response = await http.post(
      Uri.parse(Auth().api).replace(path: '/class/create'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(classes.toJson()),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
