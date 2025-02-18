import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';

Future<Future> alertDialog(BuildContext context, String text) async {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Sorry, something went wrong',
    backgroundColor: Colors.black,
    titleColor: Colors.white,
    textColor: Colors.white,
  );
}
