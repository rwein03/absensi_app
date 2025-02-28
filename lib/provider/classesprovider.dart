import 'package:absensi_app/models/classes.dart';
import 'package:absensi_app/services/classesService.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';

class Classesprovider extends ChangeNotifier {
  List<Classes> _classes = [];
  bool _isLoading = false;

  List<Classes> get classes => _classes;
  bool get isLoading => _isLoading;

  Future<void> fetchClasses(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      _classes = await APIclasses().getClasses();
      alertDialog(context, "Success", "Class added", QuickAlertType.info);
    } catch (e) {
      alertDialog(
          context, "Error", "Error Fetching Class", QuickAlertType.error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
