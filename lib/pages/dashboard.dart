// ignore_for_file: camel_case_types

import 'package:absensi_app/models/dataCalender.dart';
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
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  Map<DateTime, List<CalenderAdd>> absentDays = {};
  List<String> userData = [];
  void loadAbsentDates(List<Students> studentlist) {
    absentDays.clear();
    for (var attendance in studentlist) {
      if (attendance.status.isNotEmpty) {
        for (var e in attendance.attendances ?? []) {
          DateTime date = DateTime(e.date.year, e.date.month, e.date.day);
          absentDays[date] = absentDays[date] ?? [];
          absentDays[date]!
              .add(CalenderAdd(name: attendance.firstName, status: e.status));
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    if (absentDays.isEmpty) {
      APIstudent().getsStudents().then(
        (value) {
          setState(() {
            loadAbsentDates(value);
          });
        },
      );
    } else {
      print("absent data is loaded");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // decoration: AppStyle.decoration,
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime(2020),
                lastDay: DateTime(2030),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                eventLoader: (day) {
                  DateTime normalizedDay =
                      DateTime(day.year, day.month, day.day);
                  return absentDays[normalizedDay]
                          ?.map((e) => e.name)
                          .toList() ??
                      [];
                },
              ),
              Expanded(
                child: absentDays.containsKey(
                  DateTime(
                      _selectedDay.year, _selectedDay.month, _selectedDay.day),
                )
                    ? ListView.builder(
                        itemCount: absentDays[DateTime(_selectedDay.year,
                                _selectedDay.month, _selectedDay.day)]!
                            .length,
                        itemBuilder: (context, index) {
                          var datas = absentDays[DateTime(_selectedDay.year,
                                  _selectedDay.month, _selectedDay.day)]!
                              .toList();
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: ListTile(
                              title: Text(datas[index].name),
                              subtitle: Text("Status: ${datas[index].status}"),
                              leading: Icon(Icons.warning,
                                  color: datas[index].status == "Absent"
                                      ? Colors.red
                                      : datas[index].status == "Late"
                                          ? Colors.yellow
                                          : datas[index].status == "Excused"
                                              ? Colors.blue
                                              : Colors.green),
                            ),
                          );
                        },
                      )
                    : Center(child: Text("No absences on this day")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
