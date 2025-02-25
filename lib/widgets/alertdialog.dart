import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';

Future<Object?> alertDialog(BuildContext context, String text, String subtext,
    QuickAlertType type) async {
  return QuickAlert.show(
      context: context,
      type: type,
      title: text,
      text: subtext,
      backgroundColor: Colors.black,
      titleColor: Colors.white,
      textColor: Colors.white,
      // autoCloseDuration: Durations.extralong4,
      showConfirmBtn: true);
}
