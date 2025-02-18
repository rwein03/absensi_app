import 'package:absensi_app/AppStyle.dart';
import 'package:flutter/material.dart';

class StudentattendancePage extends StatefulWidget {
  const StudentattendancePage({super.key});

  @override
  State<StudentattendancePage> createState() => _StudentattendancePageState();
}

class _StudentattendancePageState extends State<StudentattendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.decoration,
      ),
    );
  }
}
