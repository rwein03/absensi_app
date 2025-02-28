import 'package:absensi_app/models/usersModel.dart';
import 'package:absensi_app/services/userSevices.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class Usersprovider extends ChangeNotifier {
  List<Users> _users = [];
  bool _isLoading = false;

  List<Users> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      _users = await APIuser().getUsers();
    } catch (e) {
      alertDialog(
          context, "Error", "Error Fetching Users", QuickAlertType.error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
