import 'package:absensi_app/AppStyle.dart';
import 'package:flutter/material.dart';

class studentsPage extends StatefulWidget {
  const studentsPage({super.key});

  @override
  State<studentsPage> createState() => _studentsPageState();
}

class _studentsPageState extends State<studentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.decoration,
      ),
    );
  }
}
