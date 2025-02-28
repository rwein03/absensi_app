// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, unused_local_variable

import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/storeData.dart';
import 'package:absensi_app/models/studentsModel.dart';
import 'package:absensi_app/services/attendanceService.dart';
import 'package:absensi_app/services/studentsService.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class StudentattendancePage extends StatefulWidget {
  const StudentattendancePage({super.key});

  @override
  State<StudentattendancePage> createState() => _StudentattendancePageState();
}

class _StudentattendancePageState extends State<StudentattendancePage> {
  late Future<List<Students>> getStudentDatas;
  List<Storedata> listabsent = [];
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    getStudentDatas = APIstudent().getsStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 20,
                color: Colors.grey.shade400,
              )
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: APIstudent().getsStudents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: Failed Connect to server'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No Student found'));
                  }
                  final students = snapshot.data!;
                  if (snapshot.connectionState == ConnectionState.waiting) {}
                  return ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final student = students[index];
                        var dateListAbsents = student.attendances!.where(
                          (element) {
                            return element.date == DateUtils.dateOnly(today);
                          },
                        ).toList();
                        if (dateListAbsents.isNotEmpty) {
                          return Center(
                              child: Text("Already absences on this day"));
                        } else {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${student.firstName} ${student.lastName}",
                                    style: AppStyle.smalltitle
                                        .copyWith(fontSize: 15),
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                  GroupButton(
                                    isRadio: true,
                                    onSelected: (value, index, isSelected) {
                                      String reasson = "student.student_id";
                                      listabsent.removeWhere(
                                        (element) =>
                                            element.student_id ==
                                            student.student_id,
                                      );
                                      listabsent.add(Storedata(
                                          student_id: student.student_id!,
                                          date: DateTime.now(),
                                          status: value,
                                          reasson: reasson));
                                    },
                                    enableDeselect: true,
                                    options: GroupButtonOptions(
                                        unselectedTextStyle:
                                            TextStyle(fontSize: 10),
                                        selectedTextStyle: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                        buttonHeight: 30,
                                        buttonWidth: 60,
                                        borderRadius: BorderRadius.circular(5)),
                                    buttons: [
                                      "Absent",
                                      "Late",
                                      "Excused",
                                    ],
                                  )
                                ],
                              ),
                              Divider(),
                            ],
                          );
                        }
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> SendData(List<Storedata> listabsent) async {
  final futures = listabsent
      .map(
        (element) => APIattendance().postAttendance(
          Attendance(
            student_id: element.student_id,
            date: element.date,
            status: element.status,
            reason: element.reasson,
            supportingDocument: element.supporting_document,
          ),
        ),
      )
      .toList();

  final results = await Future.wait(futures);
}
