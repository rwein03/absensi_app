import 'package:absensi_app/models/storeData.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';

class Attendanceprovider extends ChangeNotifier {
  List<Storedata> _listAbsent = [];
  bool _isLoading = false;

  List<Storedata> get listAbsent => _listAbsent;
  bool get isLoading => _isLoading;

  Future<void> addAbsent(BuildContext context, Storedata storedata) async {
    _isLoading = true;

    try {
      int exists = _listAbsent.indexWhere((entry) =>
          entry.student_id == storedata.student_id &&
          entry.date.toIso8601String().substring(0, 10) ==
              storedata.date.toIso8601String().substring(0, 10));

      if (exists != -1) {
        listAbsent[exists] = storedata;
      } else {
        _listAbsent.add(storedata);
      }
    } catch (e) {
      alertDialog(
          context, "Error", "Error Fetching Class", QuickAlertType.error);
    } finally {
      _isLoading = false;
    }
    notifyListeners();
  }

  int getSelectedIndex(int studentID) {
    var entry = _listAbsent.lastWhere((e) => e.student_id == studentID,
        orElse: () => Storedata(
            student_id: 0, date: DateTime.now(), status: "", reasson: ''));

    List<String> statusOptions = ["Absent", "Late", "Excused"];
    return statusOptions.indexOf(entry.status);
  }

  void updateReason(int studentId, String reason) {
    int index =
        _listAbsent.indexWhere((entry) => entry.student_id == studentId);
    if (index != -1) {
      _listAbsent[index].reasson = reason;
      notifyListeners(); // Refresh UI
    }
  }

  void clearAbsentList() {
    _listAbsent.clear();
    print(_listAbsent);
    notifyListeners();
  }
}
