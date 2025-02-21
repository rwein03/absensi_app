import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/widgets/student/editStudent.dart';
import 'package:flutter/material.dart';

class studentsPage extends StatefulWidget {
  const studentsPage({super.key});

  @override
  State<studentsPage> createState() => _studentsPageState();
}

class _studentsPageState extends State<studentsPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController parentcontact = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: AppStyle.decoration,
        child: Column(
          children: [
            editStudentWidget(
              title: "Firstname",
              icon: Icons.person_pin,
              obstruct: false,
              controller: firstname,
            ),
            editStudentWidget(
              title: "lastname",
              icon: Icons.person_pin,
              obstruct: false,
              controller: firstname,
            ),
            editStudentWidget(
              title: "parent contact",
              icon: Icons.person_pin,
              obstruct: false,
              controller: firstname,
            ),
          ],
        ),
      ),
    );
  }
}
