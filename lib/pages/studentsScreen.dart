// ignore_for_file: file_names, camel_case_types, deprecated_member_use, non_constant_identifier_names, unused_import

import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/widgets/student/datetimepicker.dart';
import 'package:absensi_app/widgets/student/dropdownstudent.dart';
import 'package:absensi_app/widgets/student/editStudent.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class studentsPage extends StatefulWidget {
  const studentsPage({super.key});

  @override
  State<studentsPage> createState() => _studentsPageState();
}

class _studentsPageState extends State<studentsPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController parentcontact = TextEditingController();
  TextEditingController datepicker = TextEditingController();

  final List<String> grades = ["1", "2", "3", "4", "5", "6"];
  final List<String> section = ["A", "B", "C"];
  final List<String> isActive = ["Active", "Inactive"];
  String? selectedgrade;
  String? selectedsection;
  String? selectedActive;
  DateTime? selectedDate;

  final _formKey = GlobalKey<FormState>();

  void checkValid() {
    if (_formKey.currentState!.validate()) {
      Logger().i(
          '${firstname.text.trim()}, ${lastname.text.trim()}, ${parentcontact.text.trim()}, ${datepicker.text.trim()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                Text(
                  "Register Student Form",
                  style: AppStyle.formTitle,
                ),
                Row(
                  spacing: 5,
                  children: [
                    Flexible(
                      child: editStudentWidget(
                        title: "Firstname",
                        icon: Icons.person_pin,
                        obstruct: false,
                        controller: firstname,
                      ),
                    ),
                    Flexible(
                      child: editStudentWidget(
                        title: "lastname",
                        icon: Icons.person_pin,
                        obstruct: false,
                        controller: lastname,
                      ),
                    )
                  ],
                ),
                Row(
                  spacing: 12,
                  children: [
                    Flexible(
                      child: dropdownstudent(
                        listitem: grades,
                        titlebox: 'Grade',
                        onChanged: (value) {
                          setState(() {
                            selectedgrade = value;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: dropdownstudent(
                        listitem: section,
                        titlebox: 'Section',
                        onChanged: (value) {
                          setState(() {
                            selectedsection = value;
                          });
                        },
                      ),
                    )
                  ],
                ),
                Datetimepicker(
                    controller: datepicker, title: 'Date of Birthday'),
                editStudentWidget(
                  title: "Parent contact",
                  icon: Icons.person_pin,
                  obstruct: false,
                  controller: parentcontact,
                ),
                dropdownstudent(
                  listitem: isActive,
                  titlebox: "Status",
                  onChanged: (Value) {
                    setState(() {
                      selectedActive = Value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () => checkValid(),
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size.fromWidth(AppStyle(context).widthScreen / 2),
                    backgroundColor: Colors.blueGrey.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Save"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
