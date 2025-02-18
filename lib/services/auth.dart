import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final api = 'http://192.168.1.112:8000/';
// final urlToken = 'http://10.10.104.102:8000/token';

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
