import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/widgets/student/dropdownlist.dart';
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

  final List<String> grades = ["1", "2", "3", "4", "5", "6"];
  final List<String> section = ["A", "B", "C"];
  String? selectedgrade;
  String? selectedsection;
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: AppStyle.decoration,
        // padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        child: Column(
          spacing: 12,
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
              controller: lastname,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 12,
              children: [
                Text(
                  "Grade",
                  style: AppStyle.button,
                ),
                dropdownitem(
                  listitem: grades,
                  onChanged: (value) {
                    setState(() {
                      selectedgrade = value;
                    });
                  },
                ),
                Text(
                  "Section",
                  style: AppStyle.button,
                ),
                dropdownitem(
                  listitem: section,
                  onChanged: (value) {
                    setState(() {
                      selectedsection = value;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date of Birthday",
                  style: AppStyle.button,
                ),
                TextButton(
                    onPressed: _selectDate,
                    child: Text(
                      selectedDate != null
                          ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                          : 'No date selected',
                    )),
              ],
            ),
            editStudentWidget(
              title: "parent contact",
              icon: Icons.person_pin,
              obstruct: false,
              controller: parentcontact,
            ),
          ],
        ),
      ),
    );
  }
}
