import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/widgets/dropdownitemlist.dart';
import 'package:absensi_app/widgets/edittitle.dart';
import 'package:flutter/material.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  TextEditingController classname = TextEditingController();
  final List<String> grades = ["1", "2", "3", "4", "5", "6"];
  final List<String> section = ["A", "B", "C"];
  String? selectedgrade;
  String? selectedsection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Class input form",
                style: AppStyle.formTitle,
              ),
              EditTitleWidget(
                title: "Class name",
                icon: Icons.class_,
                obstruct: false,
                controller: classname,
              ),
              Row(
                spacing: 5,
                children: [
                  Flexible(
                    child: DropdownItemList(
                      listitem: grades,
                      titlebox: "Grade",
                      onChanged: (value) {
                        setState(() {
                          selectedgrade = value;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: DropdownItemList(
                      listitem: grades,
                      titlebox: "Section",
                      onChanged: (value) {
                        setState(() {
                          selectedsection = value;
                        });
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
