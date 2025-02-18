import 'package:absensi_app/AppStyle.dart';
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

  void loadAbsentDates(List<Students> studentlist) {
    absentDays.clear();
    for (var attendance in studentlist) {
      if (attendance.status.isNotEmpty) {
        for (var e in attendance.attendances) {
          DateTime date = DateTime(e.date.year, e.date.month, e.date.day);
          absentDays[date] = absentDays[date] ?? [];
          absentDays[date]!
              .add(CalenderAdd(name: attendance.firstName, status: e.status));
        }
      }
    }
    // print(absentDays);
  }

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    getsStudents().then(
      (value) {
        setState(() {
          loadAbsentDates(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: AppStyle.decoration,
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
                  // print("Checking events for day: $normalizedDay");
                  return absentDays[normalizedDay]
                          ?.map((e) => e.name!)
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
                            .where(
                              (element) => element.status == 'Late',
                            )
                            .length,
                        itemBuilder: (context, index) {
                          var getlate = absentDays[DateTime(_selectedDay.year,
                                  _selectedDay.month, _selectedDay.day)]!
                              .where(
                                (element) => element.status == 'Late',
                              )
                              .toList();
                          return Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: ListTile(
                              title: Text(getlate[index].name),
                              subtitle:
                                  Text("Status: ${getlate[index].status}"),
                              leading: Icon(Icons.warning, color: Colors.red),
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
