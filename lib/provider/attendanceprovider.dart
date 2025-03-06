import 'package:absensi_app/models/storeData.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';

class Attendanceprovider extends ChangeNotifier {
  List<Storedata> _attendance = [];
  bool _isLoading = false;

  List<Storedata> get attendance => _attendance;
  bool get isLoading => _isLoading;

  Future<void> addAbsent(BuildContext context, Storedata storedata) async {
    _isLoading = true;
    notifyListeners();

    try {
      bool exists = _attendance.any((entry) =>
          entry.student_id == storedata.student_id &&
          entry.date.toIso8601String().substring(0, 10) ==
              storedata.date.toIso8601String().substring(0, 10));

      _attendance.add(storedata);
      notifyListeners();
      if (!exists) {
      } else {
        print("Duplicate entry found, not adding.");
      }
    } catch (e) {
      alertDialog(
          context, "Error", "Error Fetching Class", QuickAlertType.error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
