import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  // final api = 'http://192.168.1.112:8000';
  final api = 'http://10.10.104.102:8000';
  // final api = 'http://127.0.0.1:8000';

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
