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
    getStudentDatas = getsStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.decoration,
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getsStudents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No speakers found'));
                  }
                  final students = snapshot.data!;
                  if (snapshot.connectionState == ConnectionState.waiting) {}
                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      var dateListAbsents = student.attendances
                          .where(
                            (element) => element.date == today,
                          )
                          .toList();
                      if (dateListAbsents.isNotEmpty) {
                        return Center(
                            child: Text("Already absences on this day"));
                      }
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${student.firstName} ${student.lastName}",
                                  style:
                                      AppStyle.subTitle.copyWith(fontSize: 18),
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
                                        student_id: student.student_id,
                                        date: DateTime.now(),
                                        status: value,
                                        reasson: reasson));
                                  },
                                  enableDeselect: true,
                                  options: GroupButtonOptions(
                                      borderRadius: BorderRadius.circular(12)),
                                  buttons: [
                                    "Absent",
                                    "Excused",
                                  ],
                                )
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  SendData(listabsent);
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}

Future<void> SendData(List<Storedata> listabsent) async {
  final attendance = Attendance(
    studentId: 2,
    date: DateTime.now(),
    status: 'Late',
    reason: 'Sick',
    supportingDocument: null,
  );

  final result = await postAttendance(attendance);
  print('Test Result: $result');
}
