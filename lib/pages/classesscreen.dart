import 'package:absensi_app/AppStyle.dart';
import 'package:absensi_app/models/classes.dart';
import 'package:absensi_app/provider/usersprovider.dart';
import 'package:absensi_app/services/classesService.dart';
import 'package:absensi_app/widgets/alertdialog.dart';
import 'package:absensi_app/widgets/dropdownitemlist.dart';
import 'package:absensi_app/widgets/edittitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  TextEditingController classname = TextEditingController();
  final List<String> grades = ["1", "2", "3", "4", "5", "6"];
  final List<String> section = ["A", "B", "C"];

  final _formkey = GlobalKey<FormState>();

  String? selectedgrade;
  String? selectedsection;
  int? selectedUserID;
  Future<void> checkValid() async {
    if (_formkey.currentState!.validate()) {
      final classesPost = await APIclasses().insertData(Classes(
          class_id: null,
          className: classname.text,
          grade: selectedgrade.toString(),
          section: selectedsection.toString(),
          user_id: selectedUserID!.toInt()));
      if (classesPost) {
        alertDialog(
            context, "Confirmation", "Class added", QuickAlertType.info);
      }
    }
  }

  Future<void> refreshData() async {
    final userProvider = Provider.of<Usersprovider>(context, listen: false);
    await userProvider.fetchUsers(context);
  }

  @override
  Widget build(BuildContext context) {
    final userProviderData = Provider.of<Usersprovider>(context);
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Center(
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
                ),
                userProviderData.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : DropdownItemList(
                        isrefreshed: true,
                        onRefreshed: refreshData,
                        listitem: userProviderData.users
                            .map(
                              (e) => e.firstName,
                            )
                            .toList(),
                        titlebox: "Users",
                        onChanged: (value) {
                          final selectedUser =
                              userProviderData.users.firstWhere(
                            (element) => element.firstName == value,
                          );
                          setState(() {
                            selectedUserID = selectedUser.user_id;
                          });
                        },
                      ),
                ElevatedButton(
                    onPressed: checkValid,
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size.fromWidth(AppStyle(context).widthScreen / 2),
                        backgroundColor: Colors.blueGrey.shade50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
