import 'package:absensi_app/models/users.dart';
import 'package:absensi_app/services/userSevices.dart';
import 'package:flutter/material.dart';

class Usersprovider extends ChangeNotifier {
  late List<Users> _users;

  List<Users> get users => _users;

  Future<void> fetchDate() async {
    _users = await getUsers();
    notifyListeners();
  }
}
