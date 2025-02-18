import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/studentsModel.dart';
import 'package:flutter/material.dart';
import 'package:absensi_app/services/studentsService.dart';
import 'package:table_calendar/table_calendar.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  late Future<List<Students>> getStudentDatas;
  // late CalendarFormat _calendarFormat;
  // late DateTime _focusedDay;
  // late DateTime _selectedDay;
  // Map<DateTime, List<String>> _event = {};

  @override
  void initState() {
    super.initState();
    getStudentDatas = getsStudents();
    // _calendarFormat = CalendarFormat.month;
    // _focusedDay = DateTime.now();
    // _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyle.decoration,
        // child: TableCalendar(
        //   focusedDay: _focusedDay,
        //   firstDay: DateTime(2020),
        //   lastDay: DateTime(2030),
        //   calendarFormat: _calendarFormat,
        //   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        //   onDaySelected: (selectedDay, focusedDay) {
        //     setState(() {
        //       _selectedDay = selectedDay;
        //       _focusedDay = focusedDay;
        //     });
        //   },
        //   eventLoader: null,
        // ),
      ),
    );
  }
}
