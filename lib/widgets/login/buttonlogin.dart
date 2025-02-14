import 'package:absensi_app/AppStyle.dart';
import 'package:flutter/material.dart';

Widget buttonLogin(Function()? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 60,
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.blue.shade500),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        "SIGN IN",
        textAlign: TextAlign.center,
        style: AppStyle.button.copyWith(letterSpacing: 5),
      ),
    ),
  );
}
