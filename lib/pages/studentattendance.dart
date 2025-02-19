import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/studentsModel.dart';
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
  GroupButtonController controllerGroup = GroupButtonController();
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
                                  // controller: controllerGroup,
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
                            Divider()
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
                child: ElevatedButton(onPressed: () {}, child: Text("Submit")))
          ],
        ),
      ),
    );
  }
}
